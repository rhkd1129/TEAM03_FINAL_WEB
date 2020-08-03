package com.mycompany.project.SHA256;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;

public class SHA256Util {
	
	/**
	 * SHA-256 암호화 함
	 * @param source 원본
	 * @param salt(String) SALT 값
	 * @return
	 */
	public static String getEncrypt(String source, String salt) {
		return getEncrypt(source, salt.getBytes());
	}
	
	/**
	 * SHA-256 암호화 함
	 * @param source 원본
	 * @param salt(byte[]) SALT 값
	 * @return
	 */
	public static String getEncrypt(String source, byte[] salt) {
		
		String result = "";
		
		// password를 byte[] 배열로 바꿔줌(source == password)
		byte[] a = source.getBytes();
		byte[] bytes = new byte[a.length + salt.length];
		
		System.out.println(a.length);
		System.out.println(salt.length);
		System.out.println(Arrays.toString(a));
		System.out.println(Arrays.toString(bytes));
		
		/*각 매개변수별 의미
		첫 번째 매개변수: 소스가 되는 배열, 복사할 데이터가 있는 배열
		두 번째 매개변수: 소스 배열의 몇 번째 데이터부터 복사할 것인지 정해주는 인덱스 번호
		세 번째 매개변수: 목적 배열, 복사가 된 데이터를 저장할 배열
		네 번째 매개변수: 목적 배열에서 저장 시작지점을 정하는 인덱스 번호
		다섯 번째 매개변수: 배열 복사할 갯수*/
		
		// 즉, a배열의 0번째 인덱스부터 복사하여 bytes 배열의 0번째 인덱스부터 a배열의 길이만큼 저장
		System.arraycopy(a, 0, bytes, 0, a.length);
		System.arraycopy(salt, 0, bytes, a.length, salt.length);
		
		try {
			// 암호화 방식 지정 메소드
			// 'SHA-256' 알고리즘 방식으로 암호화
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			// 이 메소드가 호출될 때마다 bytes배열 내에 저장된 다이제스트 값이 갱신, 다이제스트: 해시함수를 통해 암호화된 패스워드
			md.update(bytes);
			// digest() 메소드로 값을 가져와 byteData 배열 생성
			byte[] byteData = md.digest();
			System.out.println(byteData.length);
			
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				
				// Integer 클래스에 있는 static method인 toString을 사용
				/*byteData[i] 값과 0xFF 16진수 값을 and 연산한다는 의미,
				거기에 256을 더한 후, String형의 변수에 넣기 위해 형변환하는 코드(toString에 파라미터 값으로 들어간 값이 Integer형의 16진수 값이기 때문)
				결과적으로 0x~~ 형태의 16진수 문자열값이 나오게 되는데, substring을 이용해서 0x를 제외한 뒷자리 값만 자름*/
				sb.append(Integer.toString((byteData[i] & 0xFF) + 256, 16).substring(1));
			}
			
			result = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * SALT를 얻어온다.
	 * @return
	 */
	public static String generateSalt() {
		/*random()함수는 시간을 시드로 사용해서 같은 시간에 만들 경우 똑같은 값이 나오지만,
		Securerandom()은 그렇지 않아 보안에 더 적합*/
		SecureRandom random = new SecureRandom();
		
		// salt를 8byte로 생성한 후, 그 배열을 nextByes 함수로 랜덤하게 채워줌
		byte[] salt = new byte[8];
		random.nextBytes(salt);
		System.out.println(Arrays.toString(salt));
		
		/*불변 클래스인 String과 달리 StringBuffer는 자유롭게 인스턴스 값을 변경할 수 있는 가변 클래스
		String 인스턴스의 문자열을 결합하면, 내용이 합쳐진 새로운 String 인스턴스를 생성,
		따라서 문자열을 많이 결합하면 결합할수록 공간의 낭비뿐만 아니라 속도 또한 매우 느려짐
		하지만 StringBuffer 인스턴스를 사용하면 문자열을 바로 추가할 수 있으므로 공간의 낭비도 없으며 속도도 매우 빠름*/
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < salt.length; i++) {
			// byte 값을 Hex 값으로 바꾸기.
			// for문으로 salt의 각 인덱스를 16진수로 변환해서 append
			sb.append(String.format("%02x",salt[i]));
		}
		System.out.println(sb.toString());
		return sb.toString();
	}

}
