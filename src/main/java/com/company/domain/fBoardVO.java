package com.company.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class fBoardVO {
	private int fbno;
	private String ftitle;
	private String fcontent;
	private String fwriter;
	private Date fregdate;
}
