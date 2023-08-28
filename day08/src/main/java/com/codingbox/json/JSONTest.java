package com.codingbox.json;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JSONTest {
	public static void main(String[] args) {
		JSONObject in = new JSONObject();
		in.put("gender", "남자");
		in.put("name", "김자바");
		in.put("age", "20");
		
		System.out.println( in.toJSONString() );
		
		// {"in": {"gender":"남자","name":"김자바","age":20}}
		JSONObject out = new JSONObject();
		out.put("in", in);
		System.out.println(out.toJSONString());
		//////////////////////////////////////////////////
		JSONParser parser = new JSONParser();
		JSONObject p_out = null;
		JSONObject p_in = null;
		String name = null;
		String gender = null;
		int age = 0;
		
		try {
			p_out = (JSONObject) parser.parse(out.toJSONString());
			// {"gender":"남자","name":"김자바","age":20}}
			p_in = (JSONObject) p_out.get("in");
			name = (String) p_in.get("name");
			gender = (String) p_in.get("gender");
			age = Integer.parseInt ((String) p_in.get("age"));
			
			System.out.println("이름 : " + name);
			System.out.println("나이 : " + age);
			System.out.println("성별 : " + gender);
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
	}
}
