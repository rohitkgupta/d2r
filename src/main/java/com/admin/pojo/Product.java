package com.admin.pojo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private Integer PID;
	private String title;
	private String description;
	private String category;
	private String isFor;
	private String type;
	private String city;
	private String location;
	private String budget;
	private Boolean have_swimming_pool;
	private Boolean have_security_camera;
	private Boolean have_club_house;
	private Boolean have_community_hall;
	private Boolean have_garden;
	private Boolean have_gym;
	private Boolean have_lift;
	private MultipartFile primaryImage;
	private List<MultipartFile> images;
	private String primaryImageUrl;
	private List<String> imageUrlList;
	
	public String getPrimaryImageUrl() {
		return primaryImageUrl;
	}
	public void setPrimaryImageUrl(String primaryImageUrl) {
		this.primaryImageUrl = primaryImageUrl;
	}
	public List<String> getImageUrlList() {
		return imageUrlList;
	}
	public void setImageUrlList(List<String> imageUrlList) {
		this.imageUrlList = imageUrlList;
	}
	public Integer getPID() {
		return PID;
	}
	public void setPID(Integer pID) {
		PID = pID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIsFor() {
		return isFor;
	}
	public void setIsFor(String isFor) {
		this.isFor = isFor;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getBudget() {
		return budget;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	public Boolean getHave_swimming_pool() {
		return have_swimming_pool;
	}
	public Boolean getHave_gym() {
		return have_gym;
	}
	public void setHave_gym(Boolean have_gym) {
		this.have_gym = have_gym;
	}
	public Boolean getHave_lift() {
		return have_lift;
	}
	public void setHave_lift(Boolean have_lift) {
		this.have_lift = have_lift;
	}
	public void setHave_swimming_pool(Boolean have_swimming_pool) {
		this.have_swimming_pool = have_swimming_pool;
	}
	public Boolean getHave_security_camera() {
		return have_security_camera;
	}
	public void setHave_security_camera(Boolean have_security_camera) {
		this.have_security_camera = have_security_camera;
	}
	public Boolean getHave_club_house() {
		return have_club_house;
	}
	public void setHave_club_house(Boolean have_club_house) {
		this.have_club_house = have_club_house;
	}
	public Boolean getHave_community_hall() {
		return have_community_hall;
	}
	public void setHave_community_hall(Boolean have_community_hall) {
		this.have_community_hall = have_community_hall;
	}
	public Boolean getHave_garden() {
		return have_garden;
	}
	public void setHave_garden(Boolean have_garden) {
		this.have_garden = have_garden;
	}
	public MultipartFile getPrimaryImage() {
		return primaryImage;
	}
	public void setPrimaryImage(MultipartFile primaryImage) {
		this.primaryImage = primaryImage;
	}
	public List<MultipartFile> getImages() {
		return images;
	}
	public void setImages(List<MultipartFile> images) {
		this.images = images;
	}

}
