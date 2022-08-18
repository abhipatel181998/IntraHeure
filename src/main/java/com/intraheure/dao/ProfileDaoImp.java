package com.intraheure.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.intraheure.model.LoginVo;
import com.intraheure.model.RegistrationVo;

@Repository
public class ProfileDaoImp implements ProfileDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void updateProfile(RegistrationVo registrationVo, LoginVo loginVo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("UPDATE RegistrationVo SET firstName = '" + registrationVo.getFirstName()
				+ "', lastName = '" + registrationVo.getLastName() + "', birthDate = '" + registrationVo.getBirthDate()
				+ "', gender = '" + registrationVo.getGender() + "', residentialAddress = '"
				+ registrationVo.getResidentialAddress() + "', stateVo = '" + registrationVo.getStateVo().getstateId()
				+ "', cityVo = '" + registrationVo.getCityVo().getCityId() + "', pincode='"
				+ registrationVo.getPincode() + "', mobileNumber='" + registrationVo.getMobileNumber() + "', email='"
				+ registrationVo.getEmail() + "', profilePic='" + registrationVo.getProfilePic() + "' WHERE userId='"
				+ registrationVo.getUserId() + "' ");
		query.executeUpdate();
		Query query2 = session.createQuery("UPDATE LoginVo SET userName = '" + registrationVo.getEmail()
				+ "' WHERE loginId = '" + loginVo.getLoginId() + "'");
		query2.executeUpdate();

		Transaction transaction = session.beginTransaction();
		transaction.commit();

		session.close();
	}

}
