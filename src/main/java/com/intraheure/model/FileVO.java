package com.intraheure.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="file")
public class FileVO {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column
private int id;

@Column
private String fileName;

@Column
private String filePath;

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getFileName() {
	return fileName;
}

public void setFileName(String fileName) {
	this.fileName = fileName;
}

public String getFilePath() {
	return filePath;
}

public void setFilePath(String filePath) {
	this.filePath = filePath;
}



}
