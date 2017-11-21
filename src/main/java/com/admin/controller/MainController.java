package com.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.admin.common.MailService;
import com.admin.dao.MainDao;
import com.admin.pojo.Customer;
import com.admin.pojo.Product;

@Controller
public class MainController {
	
	private static int PAGE_SIZE=10;
	
	@Autowired
	private MainDao dao;
	
	@Autowired
	private MailService mailService;
	
	private static long byteInMB=1048576;
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String search() {
		return "searchProperty";
	}
	
	@RequestMapping(value="/sell", method = RequestMethod.GET)
	public String seller() {
		return "sellProperty";
	}
	
	@RequestMapping(value="/check", method = RequestMethod.POST)
	public String check(@ModelAttribute("customerForm") Customer customer,HttpServletRequest request,HttpServletResponse response, Model model) {
		customer.setWantTo("Buy");
		/*CaptchasDotNet captchas = new CaptchasDotNet(
				  request.getSession(true),     // Ensure session
				  "rohitbhopal06",                       // client
				  "yvjGsgNRGBJko7gFPpFdCKPZEFpiM5qYTOQ0lRn2"                      // secret
				  );
		String message  = request.getParameter("message");
		String password = request.getParameter("password");
		String body;
		switch (captchas.check(password)) {
		  case 's':
		    body = "Session seems to be timed out or broken. ";
		    body += "Please try again.";
		    break;
		  case 'm':
		    body = "Every CAPTCHA can only be used once. ";
		    body += "The current CAPTCHA has already been used. ";
		    body += "Please try again.";
		    break;
		  case 'w':
		    body = "You entered the wrong code. Please try again. ";
		    break;
		  default:
		    body = "success";
		    break;
		}*/
		
		try {
			if(customer.getName().equalsIgnoreCase("puissance") || 
					customer.getName().equalsIgnoreCase("rohittestuser") ||
					customer.getName().equalsIgnoreCase("savemefromthisform") ||
					customer.getName().equalsIgnoreCase("khuljasimsim")){
				System.out.println("You are saved from customer form-"+customer.getName());
			}else{
				dao.saveCustomer(customer);
				StringBuilder msg = new StringBuilder();
				msg.append("Name:"+customer.getName()+"\n");
				msg.append("Email:"+customer.getEmail()+"\n");
				msg.append("City:"+customer.getCity()+"\n");
				msg.append("Phone:"+customer.getPhone()+"\n");
				if(customer.getWantTo()!=null)
					msg.append("Customer want to "+customer.getWantTo()+" property\n");
				if(customer.getInterestedIn()!=null)
					msg.append("Interested in "+customer.getInterestedIn()+"\n");
				msg.append("Budget:"+customer.getBudget());
				mailService.sendMail("webadmin@d2r.in", "admin@d2r.in", "New customer - www.d2r.in", msg.toString());
			}
			request.getSession().setAttribute("isFormFilled", true);
			
		} catch (Exception e) {
			System.out.println("Error while saving Customer to DB/Sending mail");
			e.printStackTrace();
			model.addAttribute("msg", "error");
			model.addAttribute("customer", customer);
			return "customerForm";
		}
		model.addAttribute("msg", "success");
		model.addAttribute("customer", customer);
		return "customerForm";
	}
	
	@RequestMapping(value="/saveSeller", method = RequestMethod.POST)
	public String saveSeller(@ModelAttribute("customerForm") Customer customer,HttpServletRequest request,HttpServletResponse response, Model model) {
		try {
			dao.saveCustomer(customer);
		} catch (Exception e) {
			System.out.println("Error while saving Seller to DB");
			e.printStackTrace();
			model.addAttribute("msg", "error");
			model.addAttribute("customer", customer);
			return "sellProperty";
		}
		model.addAttribute("msg", "success");
		model.addAttribute("customer", customer);
		return "sellProperty";
	}
	
	
	@RequestMapping(value="/isFormAlreadyFilled", method = RequestMethod.GET)
	public @ResponseBody String isFormAlreadyFilled(HttpServletRequest request,HttpServletResponse response, Model model) {
		try{
			boolean formFilled=(Boolean) request.getSession().getAttribute("isFormFilled");
			if(formFilled){
				return "true";
			}
			return "false";
		}catch(Exception e){
			return "false";
		}
	}
	
	@RequestMapping(value="/requestCall", method = RequestMethod.GET)
	public String customerForm(HttpServletRequest request,HttpServletResponse response, Model model) {
		Customer customer=new Customer();
		model.addAttribute("customer", customer);
		model.addAttribute("msg", "");
		return "customerForm";
	}
	
	@RequestMapping(value="/aboutUs", method = RequestMethod.GET)
	public String aboutUs() {
		return "aboutUs";
	}

	@RequestMapping(value="/contactUs", method = RequestMethod.GET)
	public String contactUs() {
		return "contactUs";
	}

	@RequestMapping(value="/gallery", method = RequestMethod.GET)
	public String gallery(@RequestParam String pid, HttpServletRequest request,HttpServletResponse response, Model model) {
		try {
			ArrayList<String> urlList=new ArrayList<String>();
			List<String> primaryImageIdList=dao.getImageId(Integer.parseInt(pid), true);
			if(primaryImageIdList.size()>0){
				urlList.add(getImageUrl(primaryImageIdList.get(0), request));
			}else{
				urlList.add(getImageUrl("0", request));
			}
			List<String> imageIdList=dao.getImageId(Integer.parseInt(pid), false);
			if(imageIdList.size()>0){
				for (String id : imageIdList) {
					urlList.add(getImageUrl(id, request));
				}
			}
			model.addAttribute("imageUrls", urlList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "gallery";
	}	
	
	@RequestMapping(value = "/searchProduct", method = RequestMethod.POST)
    public String searchProduct(
            @ModelAttribute("productForm") Product product,HttpServletRequest request,
                    Model model) {
		try {
			List<Product> list= getProducts(product, request);
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "product";
    }
	
	@RequestMapping(value="/showProduct", method = RequestMethod.GET)
	public String twoAndThreeBHK(@RequestParam String type, HttpServletRequest request,HttpServletResponse response, Model model) {
		try {
			Product product1 = new Product();
			product1.setType(type);
			List<Product> list= getProducts(product1, request);
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "product";
	}
	
	@RequestMapping(value="/rentalProperty", method = RequestMethod.GET)
	public String rentalProperty(HttpServletRequest request,HttpServletResponse response, Model model) {
		try {
			Product product1 = new Product();
			product1.setIsFor("Rent");
			List<Product> list= getProducts(product1, request);
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "product";
	}
	
	@RequestMapping(value="/luxuryProperty", method = RequestMethod.GET)
	public String luxuryProperty(HttpServletRequest request,HttpServletResponse response, Model model) {
		try {
			Product product1 = new Product();
			product1.setBudget("8 Crore");
			List<Product> list= getProducts(product1, request);
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "product";
	}
	
	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public String saveProduct(
            @ModelAttribute("productForm") Product product,
                    Model map) {
        int pid=0;
		try {
        		if(product.getPrimaryImage()!=null){
	        		if(!validateImage(product.getPrimaryImage())){
	        			map.addAttribute("msg", "This file format is not supported or Image size exceed to Max size limit, Please try again.");
	    				return "add_product";
	        		}
        		}
        		pid=dao.saveProduct(product);
        		map.addAttribute("pid", pid);
        		map.addAttribute("titile", product.getTitle());
        } catch(Exception e){
			e.printStackTrace();
			System.out.println("Error in Dao while adding product");
			map.addAttribute("msg", "Operation failed, please try again.");
			return "add_product";
		}
        return "file_upload_form";
    }
	
	@RequestMapping(value = "/saveImages", method = RequestMethod.POST)
    public String saveImages(
            @ModelAttribute("productForm") Product product,
                    Model map){
        try {
        		if(product.getPID()<1){
        			map.addAttribute("msg", "Please try again.");
    				return "failed";
        		}
        		if(product.getImages() != null){
	        		Iterator itr = product.getImages().iterator();
	        		while(itr.hasNext()){
	        			MultipartFile image = (MultipartFile) itr.next();
	        			if(!validateImage(image)){
	            			map.addAttribute("msg", "This file format is not supported or Image size exceed to Max size limit, Please try again.");
	            			map.addAttribute("pid", product.getPID());
	        				return "file_upload_form";
	            		}
	        		}
        		}
        		dao.saveImages(product);
        } catch(Exception e){
			e.printStackTrace();
			System.out.println("Error in Dao while adding product images");
			map.addAttribute("msg", "Operation failed, please try again.");
			map.addAttribute("pid", product.getPID());
			return "add_product";
		}
        return "product_success";
    }
	
	@RequestMapping(value = "/product", method = RequestMethod.GET)
    public String displayForm() {
        return "add_product";
    }
	
	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
    public String searchProduct(@ModelAttribute("productForm") Product productForm,
                    Model map,HttpServletRequest request,HttpServletResponse response) throws IOException {
        try {
        		List<Product> list= new ArrayList<Product>();
        		list=dao.getProducts(productForm,0,PAGE_SIZE);
        		for(int i=0;i<list.size();i++){
        			Product product = list.get(i);
        			List<String> primaryImageIdList=dao.getImageId(product.getPID(), true);
        			if(primaryImageIdList.size()>0){
        				product.setPrimaryImageUrl(getImageUrl(primaryImageIdList.get(0), request));
        			}
        			List<String> imageIdList=dao.getImageId(product.getPID(), false);
        			if(imageIdList.size()>0){
        				List<String> urlList=new ArrayList<String>();
        				for (String id : imageIdList) {
        					urlList.add(getImageUrl(id, request));
						}
        				product.setImageUrlList(urlList);
        			}
        			list.set(i, product);
        		}
        		map.addAttribute("productList", list);
        }catch(Exception e){
			e.printStackTrace();
			System.out.println("Error in Dao while adding coupon");
			map.addAttribute("msg", "Some thing went wrong, Please try again later.");
			return "failed";
		}
        return "product_success";
    }
	
	@RequestMapping(value = "/image/{id}", method = RequestMethod.GET)
	public void getCouponImage(@PathVariable String id,HttpServletResponse response) {
		try {
			InputStream iStream=null;
			iStream=dao.getImage(id,iStream);
			if(iStream !=null){
				int length = iStream.available();
				byte[] outputByte = new byte[length]; 
				response.setContentType("image/jpg"); 
				response.setHeader("Content-Disposition", "attachment;filename=image.jpg");
				ServletOutputStream out = response.getOutputStream();
				while(iStream.read(outputByte, 0, length) != -1)
				{
					out.write(outputByte, 0, length);
				}
				iStream.close();
				out.flush();
				out.close(); 
				response.setHeader("Cache-Control", "no-cache");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private String getImageUrl(String id,HttpServletRequest request){
		//String baseUrl = String.format("%s://%s:%d/AdminPortal/",request.getScheme(),  request.getServerName(), request.getServerPort());
		//String baseUrl = String.format("%s://%s:%d/D2RPortal/",request.getScheme(),  request.getServerName(), request.getServerPort());
		String baseUrl = String.format("%s://%s:%d/",request.getScheme(),  request.getServerName(), request.getServerPort());
		return baseUrl+"image/"+id;
	}
     
    
    private boolean validateImage(MultipartFile image){
    	String fileName=image.getOriginalFilename();
    	String ext = fileName.substring(fileName.lastIndexOf(".")+1);
    	
    	if(!ext.equalsIgnoreCase("jpg") && !ext.equalsIgnoreCase("png") && !ext.equalsIgnoreCase("jpeg")){
    		return false;
    	}
    	if(image.getSize()>(2*byteInMB)){
    		return false;
    	}
    	return true;
    }
    
    private List<Product> getProducts(Product product1,HttpServletRequest request) throws Exception{
    	List<Product> list= new ArrayList<Product>();
    	String next = request.getParameter("next");
		if(next!=null){
			int index =0;
			if(request.getSession().getAttribute("index")!=null){
				index = (Integer)request.getSession().getAttribute("index");
			}
			index=index+PAGE_SIZE;
			request.getSession().setAttribute("index",index);
			list =  dao.getProducts(product1,index,PAGE_SIZE);
		}else{
			list =  dao.getProducts(product1,0,PAGE_SIZE);
			request.getSession().setAttribute("index",0);
		}
    	for(int i=0;i<list.size();i++){
			Product product = list.get(i);
			List<String> primaryImageIdList=dao.getImageId(product.getPID(), true);
			if(primaryImageIdList.size()>0){
				product.setPrimaryImageUrl(getImageUrl(primaryImageIdList.get(0), request));
			}else{
				product.setPrimaryImageUrl(getImageUrl("0", request));
			}
			list.set(i, product);
		}
		return list;
    }
}
