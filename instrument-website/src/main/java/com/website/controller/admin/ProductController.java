package com.website.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.website.constant.SystemConstant;
import com.website.model.ProductModel;
import com.website.model.UserModel;
import com.website.paging.PageRequest;
import com.website.paging.Pageble;
import com.website.service.ICategoryService;
import com.website.service.IPictureService;
import com.website.service.IProductService;
import com.website.utils.FormUtil;
import com.website.utils.SessionUtil;

@WebServlet(urlPatterns = {"/admin-product"})
@MultipartConfig
public class ProductController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Inject
	private IProductService productService;
	
	@Inject
	private ICategoryService categoryService;
	
	@Inject
	private IPictureService pictureService;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel model = FormUtil.toModel(ProductModel.class, request);
		String view = "";
		if(model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem());
			model.setListResult(productService.findAll(pageble));
			model.setTotalItem(productService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem()/model.getMaxPageItem()));
			view = "/views/admin/product/list.jsp";
		} else if (model.getType().equals(SystemConstant.EDIT)) {
			if (model.getId() !=null) {
				model = productService.findOne(model.getId());
			} else {
				
			}
			request.setAttribute("categories", categoryService.findAll());
			view = "/views/admin/product/edit.jsp";
		}
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel model = FormUtil.toModel(ProductModel.class, request);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		model.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
		Long addProduct = productService.save(model);
		String fileName = "";
		if(addProduct > 0) {
			List<Part> fileParts = request.getParts().stream().filter(part -> "picture".equals(part.getName())).collect(Collectors.toList());
			if (fileParts != null && fileParts.size() > 0 && (fileParts.size() <= 5 || fileParts.size() < 1)) {
				for (Part filePart : fileParts) {
			        fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
			        String dirPath = request.getServletContext().getRealPath("/images");
					File saveDir = new File(dirPath);
					if (!saveDir.exists()) {
						saveDir.mkdirs();
					}
					String filePath = dirPath + File.separator + fileName;
					filePart.write(filePath);
					pictureService.save(fileName, addProduct);
			    }
			}
		}
		
		return;
	}
}
	