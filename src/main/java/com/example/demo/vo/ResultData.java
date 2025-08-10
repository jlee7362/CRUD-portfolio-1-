package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResultData<T> {

	private String resultData;	// S-1, F-1
	private String msg;			//메시지
	private T data;				//응답 데이터
	
	//데이터가 없을 때
	public static <T> ResultData<T> from(String resultCode, String msg) {
		return new ResultData<>(resultCode, msg, null);
	}
	//데이터가 있을 때
	public static <T> ResultData<T> from(String resultCode, String msg, T data) {
		return new ResultData<>(resultCode, msg, data);
	}

}
