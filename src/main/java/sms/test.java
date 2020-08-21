package sms;

import java.util.Scanner;

public class test{
    public static void main(String args[]) throws Exception {
        
    	String no1 = "16억 6143만 9625원";
    	String no2 = "6078만 4377원";
    	String no3 = "154만 7926원";
    	String no4 = "5만원";
    	String no5 = "5천원";
    	
    	int lotonum1 = 7;
    	int lotonum2 = 37;
    	int lotonum3 = 38;
    	int lotonum4 = 39;
    	int lotonum5 = 40;
    	int lotonum6 = 44;
    	int lotonum7 = 18;  	

    	boolean check0 = false;
    	boolean check1 = false;
    	boolean check2 = false;
    	boolean check3 = false;
    	boolean check4 = false;
    	boolean check5 = false;
    	boolean check6 = false;
    	
    	boolean lotocheck0 = false;
    	boolean lotocheck1 = false;
    	boolean lotocheck2 = false;
    	boolean lotocheck3 = false;
    	boolean lotocheck4 = false;
    	boolean lotocheck5 = false;
    	boolean lotocheck6 = false;
    	
    	Scanner scanner = new Scanner(System.in);
    	
    	String rotonum = "";
    	for(int i = 0; i < 7; i++) {
    		System.out.println("1부터 45까지 로또 번호를 6개를 입력하시오.(단 ,를 붙여서 입력하시오.)");  
    		rotonum = scanner.nextLine(); 
    		String[] parts = rotonum.split(",");
    		
    		if(Integer.parseInt(parts[0]) > 45 || Integer.parseInt(parts[0]) < 1) {
    			System.out.println(parts[0]);
    			System.out.println("로또 번호를 잘못 입력 하셨습니다.");
    			break;
    		}else if(Integer.parseInt(parts[0]) < 46 && Integer.parseInt(parts[0]) > 0) {
    			System.out.println(parts[0]);
    			check0 = true;
    			if(Integer.parseInt(parts[0]) == lotonum1 || Integer.parseInt(parts[0]) == lotonum2 ||
						Integer.parseInt(parts[0]) == lotonum3 || Integer.parseInt(parts[0]) == lotonum4 ||
						Integer.parseInt(parts[0]) == lotonum5 || Integer.parseInt(parts[0]) == lotonum6 ||
						Integer.parseInt(parts[0]) == lotonum7) {
    					lotocheck0 = true;
    			}
    			System.out.println("정상입력");
    		}
    		if(Integer.parseInt(parts[1]) > 45 || Integer.parseInt(parts[1]) < 1) {
    			System.out.println(parts[1]);
    			System.out.println("로또 번호를 잘못 입력 하셨습니다.");
    			break;
    		}else if(Integer.parseInt(parts[1]) < 46 && Integer.parseInt(parts[1]) > 0) {
    			System.out.println(parts[1]);
    			check1 = true;

				if(Integer.parseInt(parts[1]) == lotonum1 || Integer.parseInt(parts[1]) == lotonum2 ||
					Integer.parseInt(parts[1]) == lotonum3 || Integer.parseInt(parts[1]) == lotonum4 ||
					Integer.parseInt(parts[1]) == lotonum5 || Integer.parseInt(parts[1]) == lotonum6 ||
					Integer.parseInt(parts[1]) == lotonum7) {
					lotocheck1 = true;
				}    
    			System.out.println("정상입력");
    		}
    		if(Integer.parseInt(parts[2]) > 45 || Integer.parseInt(parts[2]) < 1) {
    			System.out.println(parts[2]);
    			System.out.println("로또 번호를 잘못 입력 하셨습니다.");
    			break;
    		}else if(Integer.parseInt(parts[2]) < 46 && Integer.parseInt(parts[2]) > 0) {
    			System.out.println(parts[2]);
    			check2 = true;
    			
				if(Integer.parseInt(parts[2]) == lotonum1 || Integer.parseInt(parts[2]) == lotonum2 ||
					Integer.parseInt(parts[2]) == lotonum3 || Integer.parseInt(parts[2]) == lotonum4 ||
					Integer.parseInt(parts[2]) == lotonum5 || Integer.parseInt(parts[2]) == lotonum6 ||
					Integer.parseInt(parts[2]) == lotonum7) {
					lotocheck2 = true;
				}    	    			
    			System.out.println("정상입력");
    		}
    		if(Integer.parseInt(parts[3]) > 45 || Integer.parseInt(parts[3]) < 1) {
    			System.out.println(parts[3]);
    			System.out.println("로또 번호를 잘못 입력 하셨습니다.");
    			break;
    		}else if(Integer.parseInt(parts[3]) < 46 && Integer.parseInt(parts[3]) > 0) {
    			System.out.println(parts[3]);
    			check3 = true;
    			
				if(Integer.parseInt(parts[3]) == lotonum1 || Integer.parseInt(parts[3]) == lotonum2 ||
					Integer.parseInt(parts[3]) == lotonum3 || Integer.parseInt(parts[3]) == lotonum4 ||
					Integer.parseInt(parts[3]) == lotonum5 || Integer.parseInt(parts[3]) == lotonum6 ||
					Integer.parseInt(parts[3]) == lotonum7) {
					lotocheck3 = true;
				}    			
    			System.out.println("정상입력");
    		}
    		if(Integer.parseInt(parts[4]) > 45 || Integer.parseInt(parts[4]) < 1) {
    			System.out.println(parts[4]);
    			System.out.println("로또 번호를 잘못 입력 하셨습니다.");
    			break;
    		}else if(Integer.parseInt(parts[4]) < 46 && Integer.parseInt(parts[4]) > 0) {
    			System.out.println(parts[4]);
    			check4 = true;
    			
				if(Integer.parseInt(parts[4]) == lotonum1 || Integer.parseInt(parts[4]) == lotonum2 ||
					Integer.parseInt(parts[4]) == lotonum3 || Integer.parseInt(parts[4]) == lotonum4 ||
					Integer.parseInt(parts[4]) == lotonum5 || Integer.parseInt(parts[4]) == lotonum6 ||
					Integer.parseInt(parts[4]) == lotonum7) {
					lotocheck4 = true;
				}      			
    			System.out.println("정상입력");
    		}
    		if(Integer.parseInt(parts[5]) > 45 || Integer.parseInt(parts[5]) < 1) {
    			System.out.println(parts[5]);
    			System.out.println("로또 번호를 잘못 입력 하셨습니다.");
    			break;
    		}else if(Integer.parseInt(parts[5]) < 46 && Integer.parseInt(parts[5]) > 0) {
    			System.out.println(parts[5]);
    			check5 = true;
    			
				if(Integer.parseInt(parts[5]) == lotonum1 || Integer.parseInt(parts[5]) == lotonum2 ||
					Integer.parseInt(parts[5]) == lotonum3 || Integer.parseInt(parts[5]) == lotonum4 ||
					Integer.parseInt(parts[5]) == lotonum5 || Integer.parseInt(parts[5]) == lotonum6 ||
					Integer.parseInt(parts[5]) == lotonum7) {
					lotocheck5 = true;
				}    	    			
    			System.out.println("정상입력");
    		}    		
    		if(Integer.parseInt(parts[6]) > 45 || Integer.parseInt(parts[6]) < 1) {
    			System.out.println(parts[6]);
    			System.out.println("로또 번호를 잘못 입력 하셨습니다.");
    			break;
    		}else if(Integer.parseInt(parts[6]) < 46 && Integer.parseInt(parts[6]) > 0) {
    			System.out.println(parts[6]);
    			check6 = true;
    			
				if(Integer.parseInt(parts[6]) == lotonum1 || Integer.parseInt(parts[6]) == lotonum2 ||
					Integer.parseInt(parts[6]) == lotonum3 || Integer.parseInt(parts[6]) == lotonum4 ||
					Integer.parseInt(parts[6]) == lotonum5 || Integer.parseInt(parts[6]) == lotonum6 ||
					Integer.parseInt(parts[6]) == lotonum7) {
					lotocheck6 = true;
				}        			
    			System.out.println("정상입력");
    			
    			if(check0 == true && check1 == true && check2 == true && check3 == true && 
    				check4 == true && check5 == true && check6 == true ) {
    				System.out.println("로또 번호를 모두 정상적으로 입력 하셨습니다.");
    				
    				System.out.println("1번 번호 : "+lotocheck0 + "|" + "2번 번호 : "+lotocheck1 
    						+ "|" +"3번 번호 : "+lotocheck2 + "|" +"4번 번호 : "+lotocheck3 + "|" +"5번 번호 : "+lotocheck4 + "|" +
    						"6번 번호 : "+lotocheck5 + "|" + "7번 번호 : "+lotocheck6);
    				
    				if(lotocheck0 == true && lotocheck1 == true && lotocheck2 == true && lotocheck3 == true 
    					&& lotocheck4 == true && lotocheck5 == true && lotocheck6 == true ) {
    					System.out.println("1등 당첨!!");
    				}else if(lotocheck0 == true && lotocheck1 == true && lotocheck2 == true && lotocheck3 == true 
						&& lotocheck4 == true && lotocheck5 == true) {
						System.out.println("2등 당첨!!");
					}else if(lotocheck0 == true && lotocheck1 == true && lotocheck2 == true && lotocheck3 == true 
						&& lotocheck4 == true) {
						System.out.println("3등 당첨!!");
					}else if(lotocheck0 == true && lotocheck1 == true && lotocheck2 == true && lotocheck3 == true){
						System.out.println("4등 당첨!!");
					}else if(lotocheck0 == true && lotocheck1 == true && lotocheck2 == true){
						System.out.println("5등 당첨!!");
					}
					
				
    				
    				
    			}//2차 번호 정상 확인

    			break;  			
    		}//1차 번호 정상 확인

    	}//for문
    	
    	

    	
    	
    	
    	
    	
    	
    	
    }
}