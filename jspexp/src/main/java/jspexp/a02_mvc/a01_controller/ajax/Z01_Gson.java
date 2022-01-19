package jspexp.a02_mvc.a01_controller.ajax;

import java.util.ArrayList;

import com.google.gson.Gson;

import jspexp.z01_vo.Emp;
import jspexp.z01_vo.Person;
import jspexp.z01_vo.Product;

public class Z01_Gson {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person p01 = new Person("홍길동",25,"서울신림동");
		// 1 Gson 객체 생성
		Gson gson = new Gson();
		// 2. 기능 메서드를 통해서 json문자열 가져오기
		String personJson = gson.toJson(p01);
		System.out.println(personJson);
		// ex) Product 객체 만들고, gson api를 이용해서 문자열을 출력하세요
		
		Product prod = new Product("사과",3000,2);
		String productJson = gson.toJson(prod);
		System.out.println(productJson);
		ArrayList<Product> plist = new ArrayList<Product>();
		plist.add(new Product("사과",3000,2));
		plist.add(new Product("바나나",4000,2));
		plist.add(new Product("딸기",12000,2));
		
		String listJson = gson.toJson(plist);
		System.out.println(listJson);
		ArrayList<Emp> emplist = new ArrayList<Emp>();
		emplist.add(new Emp("홍길동","사원",3500,"2022-04-30",10,7080));
		emplist.add(new Emp("김길동","대리",4500,"2019-04-30",10,6080));
		emplist.add(new Emp("신길동","과장",5500,"2010-04-30",10,5080));
		
		String emplistJson = gson.toJson(emplist);
		System.out.println(emplistJson);
	}

}
