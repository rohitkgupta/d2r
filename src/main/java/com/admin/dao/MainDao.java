package com.admin.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.admin.pojo.Customer;
import com.admin.pojo.Product;

@Component("MainDao")
public class MainDao {
	
	private static Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		//Connection con = DriverManager.getConnection("jdbc:mysql://127.11.221.2:3306/d2r","adminViGFNwP","vxbtNAFvRohitYYYY");
		//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/d2r","root","root");
		//Connection con = DriverManager.getConnection("jdbc:mysql://127.5.13.2:3306/d2r","admineyGh6PY","vxb8fVztNAFv");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.9.132.2:3306/d2r","GUI_USER","vxbtNAFvRohitYYYY");
		return con;
	}
	
	public int saveProduct(Product product) throws Exception{
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		List<MultipartFile> files = null;
		try {
			con = getConnection();
			ps = con.prepareStatement("INSERT INTO product (`title`,`description`,`category`,`for`,`type`,`city`,`location`," +
					"`budget`,`have_gym`,`have_swimming_pool`,`have_security_camera`,`have_club_house`,`have_community_hall`,`have_garden`,`have_lift`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, product.getTitle());
			ps.setString(2, product.getDescription());
			ps.setString(3, product.getCategory());
			ps.setString(4, product.getIsFor());
			ps.setString(5, product.getType());
			ps.setString(6, product.getCity());
			ps.setString(7, product.getLocation());
			ps.setString(8, product.getBudget());
			if(product.getHave_gym() != null){
				ps.setBoolean(9, product.getHave_gym());
			}else{
				ps.setBoolean(9, false);
			}
			if(product.getHave_swimming_pool() != null){
				ps.setBoolean(10, product.getHave_swimming_pool());
			}else{
				ps.setBoolean(10, false);
			}
			if(product.getHave_security_camera() != null){
				ps.setBoolean(11, product.getHave_security_camera());
			}else{
				ps.setBoolean(11, false);
			}
			if(product.getHave_club_house() != null){
				ps.setBoolean(12, product.getHave_club_house());
			}else{
				ps.setBoolean(12, false);
			}
			if(product.getHave_community_hall() != null){
				ps.setBoolean(13, product.getHave_community_hall());
			}else{
				ps.setBoolean(13, false);
			}
			if(product.getHave_garden() != null){
				ps.setBoolean(14, product.getHave_garden());
			}else{
				ps.setBoolean(14, false);
			}
			if(product.getHave_lift() != null){
				ps.setBoolean(15, product.getHave_lift());
			}else{
				ps.setBoolean(15, false);
			}
			ps.executeUpdate();
			
			ps2=con.prepareStatement("SELECT MAX(`pid`) FROM product");
			rs=ps2.executeQuery();
			if(rs.next()){
				product.setPID(rs.getInt(1));
			}
			ps3 = con.prepareStatement("INSERT INTO image (`pid`,`is_primary`,`image`) VALUES(?,?,?)");
			if(product.getPrimaryImage()!=null){
				ps3.setInt(1, product.getPID());
				ps3.setBoolean(2, true);
				ps3.setBinaryStream(3, product.getPrimaryImage().getInputStream(),product.getPrimaryImage().getInputStream().available());
				ps3.addBatch();
			}
			ps3.executeBatch();
			System.out.println("Data Saved");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw e;
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally{
			try{
				if(ps != null) ps.close();
				if(ps2 != null) ps2.close();
				if(ps3 != null) ps3.close();
				if(rs != null) rs.close();
				if(con != null) con.close();
				if(files != null){
					Iterator itr=files.iterator();
					while(itr.hasNext()){
						MultipartFile file=(MultipartFile)itr.next();
						file.getInputStream().close();
					}
				}
			} catch(Exception ex){}
		}
		return product.getPID();
		
	}
	
	public void saveImages(Product product) throws Exception{
		Connection con = null;
		PreparedStatement ps3 = null;
		List<MultipartFile> files = null;
		try {
			con = getConnection();
			ps3 = con.prepareStatement("INSERT INTO image (`pid`,`is_primary`,`image`) VALUES(?,?,?)");
			if(product.getImages() != null){
				files = product.getImages();
				Iterator itr=files.iterator();
				while(itr.hasNext()){
					MultipartFile file=(MultipartFile)itr.next();
					ps3.setInt(1, product.getPID());
					ps3.setBoolean(2, false);
					ps3.setBinaryStream(3, file.getInputStream(),file.getInputStream().available());
					ps3.addBatch();
				}
			}
			ps3.executeBatch();
			System.out.println("Images Saved");
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally{
			try{
				if(ps3 != null) ps3.close();
				if(con != null) con.close();
				if(files != null){
					Iterator itr=files.iterator();
					while(itr.hasNext()){
						MultipartFile file=(MultipartFile)itr.next();
						file.getInputStream().close();
					}
				}
			} catch(Exception ex){}
		}
	}
	
	public List<Product> getProducts(Product product,int from,int size) throws Exception{
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		StringBuilder sb=new StringBuilder();
		boolean isFirst=true;
		sb.append("SELECT `title`,`pid`,`description`,`category`,`for`,`type`,`city`,`location`,`budget`,`have_gym`,`have_swimming_pool`,`have_security_camera`,`have_club_house`,`have_community_hall`,`have_garden`,`have_lift` FROM product ");
		try {
			if(product.getCategory()!=null && !product.getCategory().equalsIgnoreCase("all")){
				sb.append(" WHERE category='"+product.getCategory()+"' ");
				isFirst=false;
			}
			if(product.getIsFor()!=null && !product.getIsFor().equalsIgnoreCase("all")){
				if(isFirst){
					sb.append(" WHERE `for`='"+product.getIsFor()+"'");
				}else{
					sb.append(" AND `for`='"+product.getIsFor()+"'");
				}
				isFirst=false;
			}
			if(product.getType()!=null && !product.getType().equalsIgnoreCase("all") && !product.getType().trim().equalsIgnoreCase("")){
				if(isFirst){
					sb.append(" WHERE type='"+product.getType()+"'");
				}else{
					sb.append(" AND type='"+product.getType()+"'");
				}
				isFirst=false;
			}if(product.getLocation()!=null && !product.getLocation().equalsIgnoreCase("all")){
				if(isFirst){
					sb.append(" WHERE location='"+product.getLocation()+"'");
				}else{
					sb.append(" AND location='"+product.getLocation()+"'");
				}
				isFirst=false;
			}if(product.getHave_gym()!=null){
				if(isFirst){
					sb.append(" WHERE have_gym='"+product.getHave_gym()+"'");
				}else{
					sb.append(" AND have_gym='"+product.getHave_gym()+"'");
				}
				isFirst=false;
			}if(product.getBudget()!=null && !product.getBudget().equalsIgnoreCase("all")){
				if(product.getBudget().contains("Lacs")){
					if(isFirst){
						sb.append(" WHERE budget<='"+product.getBudget()+"' AND budget LIKE '%Lacs'");
					}else{
						sb.append(" AND budget<='"+product.getBudget()+"' AND budget LIKE '%Lacs'");
					}
				}else{
					if(isFirst){
						sb.append(" WHERE budget<='"+product.getBudget()+"' AND budget LIKE '%Crore' OR budget LIKE '%Lacs'");
					}else{
						sb.append(" AND budget<='"+product.getBudget()+"' AND budget LIKE '%Crore' OR budget LIKE '%Lacs'");
					}
				}
				isFirst=false;
			}if(product.getHave_lift()!=null){
				if(isFirst){
					sb.append(" WHERE have_lift="+product.getHave_lift());
				}else{
					sb.append(" AND have_lift="+product.getHave_lift());
				}
				isFirst=false;
			}if(product.getHave_swimming_pool()!=null){
				if(isFirst){
					sb.append(" WHERE have_swimming_pool="+product.getHave_swimming_pool());
				}else{
					sb.append(" AND have_swimming_pool="+product.getHave_swimming_pool());
				}
				isFirst=false;
			}if(product.getHave_security_camera()!=null){
				if(isFirst){
					sb.append(" WHERE have_security_camera="+product.getHave_security_camera());
				}else{
					sb.append(" AND have_security_camera="+product.getHave_security_camera());
				}
				isFirst=false;
			}if(product.getHave_club_house()!=null){
				if(isFirst){
					sb.append(" WHERE have_club_house="+product.getHave_club_house());
				}else{
					sb.append(" AND have_club_house="+product.getHave_club_house());
				}
				isFirst=false;
			}if(product.getHave_community_hall()!=null){
				if(isFirst){
					sb.append(" WHERE have_community_hall="+product.getHave_community_hall());
				}else{
					sb.append(" AND have_community_hall="+product.getHave_community_hall());
				}
				isFirst=false;
			}if(product.getHave_garden()!=null){
				if(isFirst){
					sb.append(" WHERE have_garden="+product.getHave_garden());
				}else{
					sb.append(" AND have_garden="+product.getHave_garden());
				}
				isFirst=false;
			}
			if(product.getBudget()!=null && !product.getBudget().equalsIgnoreCase("all")){
				sb.append(" ORDER BY budget DESC");
			}else{
				sb.append(" ORDER BY pid DESC");
			}
			sb.append(" LIMIT "+from+","+size);
			con = getConnection();
			st = con.createStatement();
			rs = st.executeQuery(sb.toString());
			while(rs.next()){
				Product data=new Product();
				data.setTitle(rs.getString(1));
				data.setPID(rs.getInt(2));
				data.setDescription(rs.getString(3));
				data.setCategory(rs.getString(4));
				data.setIsFor(rs.getString(5));
				data.setType(rs.getString(6));
				data.setCity(rs.getString(7));
				data.setLocation(rs.getString(8));
				data.setBudget(rs.getString(9));
				data.setHave_gym(rs.getBoolean(10));
				data.setHave_swimming_pool(rs.getBoolean(11));
				data.setHave_security_camera(rs.getBoolean(12));
				data.setHave_club_house(rs.getBoolean(13));
				data.setHave_community_hall(rs.getBoolean(14));
				data.setHave_garden(rs.getBoolean(15));
				data.setHave_lift(rs.getBoolean(16));
				list.add(data);
			}
			return list;
		}finally{
			try{
				if(st != null) st.close();
				if(rs != null) rs.close();
				if(con != null) con.close();
			} catch(Exception ex){}
		}
	}
	
	
	public List<String> getImageId(int pid,boolean isPrimary) throws Exception{
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		try{
			con = getConnection();
			st = con.prepareStatement("SELECT id FROM image WHERE pid=? AND is_primary=?");
			st.setInt(1, pid);
			st.setBoolean(2, isPrimary);
			rs = st.executeQuery();
			while(rs.next()){
				list.add(rs.getString(1));
			}
			return list;
		}finally{
			try{
				if(st != null) st.close();
				if(rs != null) rs.close();
				if(con != null) con.close();
			} catch(Exception ex){}
		}
	}
	

	public InputStream getImage(String id, InputStream iStream) throws Exception {
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			st = con.prepareStatement("SELECT image FROM image WHERE id=?");
			st.setString(1, id);
			rs = st.executeQuery();
			if(rs.next()){
				iStream=rs.getBinaryStream(1);
			}
			return iStream;
		}finally{
			try{
				if(st != null) st.close();
				if(rs != null) rs.close();
				if(con != null) con.close();
			} catch(Exception ex){}
		}
	}
	
	public void saveCustomer(Customer customer) throws Exception{
		Connection con = null;
		PreparedStatement ps3 = null;
		try {
			con = getConnection();
			ps3 = con.prepareStatement("INSERT INTO customer (`name`,`phone`,`email`,`city`,`want_to`,`interested_in`,`date`,`budget`) VALUES(?,?,?,?,?,?,CURRENT_TIMESTAMP,?)");
			ps3.setString(1, customer.getName());
			ps3.setString(2, customer.getPhone());
			ps3.setString(3, customer.getEmail());
			ps3.setString(4, customer.getCity());
			ps3.setString(5, customer.getWantTo());
			ps3.setString(6, customer.getInterestedIn());
			ps3.setString(7, customer.getBudget());
			ps3.executeUpdate();
			System.out.println("Customer Saved");
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally{
			try{
				if(ps3 != null) ps3.close();
				if(con != null) con.close();
			} catch(Exception ex){}
		}
	}
}
