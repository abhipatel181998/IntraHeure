package com.intraheure.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.intraheure.model.FileVO;

@Service
public class FileService {
	@Autowired
	SessionFactory sessionFactory;

	public void itemInsert(FileVO itemVO1) {
		Session session = sessionFactory.openSession();
		session.save(itemVO1);

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}
}
