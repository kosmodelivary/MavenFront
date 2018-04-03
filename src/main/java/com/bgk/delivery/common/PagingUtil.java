package com.bgk.delivery.common;

import javax.servlet.http.HttpServletRequest;

public class PagingUtil {
	public static String pagingBootStrapStyle(int totalRecordCount,
											  int pageSize,
											  int blockPage,
											  int nowPage,
											  String page,
											  HttpServletRequest req){
		
		String pagingStr="";
		
		//1.전체 페이지 구하기
		int totalPage= (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage - 1) / blockPage) * blockPage + 1;

		//처음 및 이전을 위한 로직
		if(intTemp != 1){
			pagingStr+="" + 
					"<a href='"+page+"nowPage=1'>\r\n" + 
					"<a class=\"btn_paging\" href='"+page+"nowPage="+(intTemp -blockPage)+"' >\r\n" + 
					"<img src=\""+req.getContextPath()+"/resources/images/common/paging_prev.gif\" alt=\"이전페이지\" />" + 
					"</a>\r\n";   
			
		}
		
		//페이지 표시 제어를 위한 변수
		int blockCount = 1;
		
		//페이지를 뿌려주는 로직
		//블락 페이지 수만큼 혹은 마지막 페이지가 될때까지 페이지를 표시한다1 
		while(blockCount <= blockPage && intTemp <= totalPage){  // 페이지 오버 를 체크
				//현재 페이지를 의미함
			if(intTemp == nowPage){  
				pagingStr+="<a href='#'><span style='Color:red'>"+intTemp+"</span></a>";
			}
		     else
		    	 pagingStr+="<a href='"+page+"nowPage="+intTemp+"'>"+intTemp+"</a>";
		       
			intTemp = intTemp + 1;
			blockCount = blockCount + 1;
		
		}

		//다음 및 마지막을 위한 로직
			
		if(intTemp <= totalPage){
			pagingStr+="" + 
					"<a class=\"btn_paging\" href='"+page+"nowPage="+intTemp+"'>\r\n" + 
					"<img src=\""+req.getContextPath()+"/resources/images/common/paging_next.gif\" alt=\"다음페이지\" />\r\n" + 
					"</a>\r\n";
							   
		}
		return pagingStr;
	}
	
}
