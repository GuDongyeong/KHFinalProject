package com.privateplaylist.www.member.service;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import common.exception.FileException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.privateplaylist.www.member.dao.MemberDao;
import com.privateplaylist.www.member.vo.Member;

import common.exception.MailException;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public int insertMember(Member member) {

		String password = member.getUserPw();
		String secPw = "";
		
		// 암호화
		secPw = passwordEncoder.encode(password);
		
		member.setUserPw(secPw);

		return memberDao.insertMember(member);
	}

	@Override
	public void insertTeacherFile(@RequestParam("joinFiles") MultipartFile files, Map<String, String> fileInfo, String root) throws FileException {

		memberDao.insertFile(files, fileInfo);

	}


	@Override
	public Member selectMember(Map<String, Object> memberMap) {
		
		// 사용자가 입력한 비밀번호
		String password = (String) memberMap.get("userPw");

		// DB에 저장된 사용자 정보
		Member member = memberDao.selectMember(memberMap);
		
		
		// 사용자가 입력한 비밀번호와 DB에 인코딩되어 저장된 비밀번호가 같은지 확인
		if (passwordEncoder.matches(password, member.getUserPw())) {
			return member;
		} else {
			return null;
		}
	}

	@Override
	public int selectId(String userId) {
		return memberDao.selectId(userId);
	}

	public void mailSending(String email, int code_check) throws MailException {
		
		String setfrom = "snn7452@naver.com";
		String tomail = email;
		String title = "슬기로운 과외생활 회원가입 인증메일 입니다.";
		String htmlBody = 
				"<h2>회원가입을 위해 인증번호를 입력해주세요!</h2>"
				+ "인증번호는 " + code_check + "입니다.";

		try {

			mailSender.send(new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws MessagingException {
					MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					// 보내는 이
					message.setFrom(setfrom);
					// 받는 이
					message.setTo(tomail);
					// 메일 제목
					message.setSubject(title);
					// 메일 내용
					// 두번째 boolean값은 html 여부 (true : html , false : text)
					message.setText(htmlBody, true);
				};
			});
		} catch (Exception e) {
			e.printStackTrace();
			throw new MailException("M_ERROR_01");

		}
	}

	@Override
	public void logOut(HttpSession session) {

		memberDao.logOut(session);
		
	}

}

//		String setfrom = "snn7452@naver.com";
//		String tomail = member.getUserEmail();
//		String title = "슬기로운 과외생활 회원가입 인증메일 입니다.";
//		String htmlBody = "<form " + "action='http://" + urlPath + "/member/joinImpl'"
//				+ " method='post' enctype='multipart/form-data'>"
//				+ "<script> function btnClick() { alert('회원가입이 완료되었습니다!'); } </script>" + "<h3>회원가입을 환영합니다.</h3>"
//				+ "정상적인 회원가입을 위해 아래의 링크를 클릭해주세요." + "<input type='hidden' value='" + member.getUserId()
//				+ "' id='userId' name='userId'>" + "<input type='hidden' value='" + member.getUserPw()
//				+ "' id='userPw' name='userPw'>" + "<input type='hidden' value='" + member.getUserEmail()
//				+ "' id='userEmail' name='userEmail'>" + "<input type='hidden' value='" + member.getUserActor()
//				+ "' id='userActor' name='userActor'>" + "<input type='hidden' value='" + member.getUserName()
//				+ "' id='userName' name='userName'>" + "<input type='hidden' value='" + member.getUserPhone()
//				+ "' id='userPhone' name='userPhone'>" + "<input type='hidden' value='" + member.getPostCode()
//				+ "' id='postCode' name='postCode'>" + "<input type='hidden' value='" + member.getRoadAddress()
//				+ "' id='roadAddress' name='roadAddress'>" + "<input type='hidden' value='" + member.getDetailAddress()
//				+ "' id='detailAddress' name='detailAddress'>" + "<input type='hidden' value='" + member.getUserGender()
//				+ "' id='userGender' name='userGender'>"
//				+ "<input type='hidden' value='" + member.getUserBirth() + "' id='userBirth' name='userBirth'>"
//				+ "<br><br> <button type='submit' onclick='btnClick();'>회원가입 완료하기</button></form>";