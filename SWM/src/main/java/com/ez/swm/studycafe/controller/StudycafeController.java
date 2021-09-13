package com.ez.swm.studycafe.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ez.swm.book.vo.BookTime;
import com.ez.swm.studycafe.service.StudycafeService;
import com.ez.swm.studycafe.vo.Studycafe;
import com.ez.swm.studycafe.vo.StudycafeDetailFile;
import com.ez.swm.studycafe.vo.StudycafeReview;

@Controller
public class StudycafeController {
	
	@Autowired
	private StudycafeService studycafeService;
	
	// ���͵� ī�� ����Ʈ ��� �̵�
	@RequestMapping(value="/studycafeList")
	public ModelAndView studycafeList(HttpServletRequest request, Studycafe studtycafe) {
		HttpSession session = request.getSession();
		session.setAttribute("menu", "studycafe");
		
		
		ModelAndView mav = new ModelAndView();
		List<Studycafe> list = studycafeService.BestStudycafeList();
		List<Studycafe> list2 = studycafeService.NewStudycafeList();
		
		mav.addObject("bestStudycafeList", list);
		mav.addObject("newStudycafeList",list2);
		mav.setViewName("studycafe/studycafeList");
		return mav;
	}
	
	// ���͵� ī�� ����Ʈ ��� �̵�
	@RequestMapping(value="/studycafeSearch")
	public ModelAndView studycafeSearch(@RequestParam("keyword") String keyword) {
		ModelAndView mav = new ModelAndView();
		
		List<Studycafe> list = studycafeService.studycafeSearch(keyword);
		mav.setViewName("studycafe/studycafeSearch");
		mav.addObject("studycafeSearchList", list);
		
		return mav;
	}
	
	// ���͵� ī�� �󼼺��� ��� �̵�
	@RequestMapping(value="/studycafe/studycafeDetail")
	public ModelAndView studycafeDetail(@RequestParam("studycafe_no") int studycafe_no) {
		ModelAndView mav = new ModelAndView();
		List<StudycafeDetailFile> list = studycafeService.studycafeDetailFile(studycafe_no);
		
		Studycafe studycafeOne = studycafeService.getStudycafeOne(studycafe_no);
		
		//db���� ������������
		HashMap<String, Object> infoReview =studycafeService.getReviewGrade(studycafe_no);
		
		
		double avg=0;
		double total=0;
		double count=0;
		
		//��ϵ� ������ �ִٸ� ���ٸ� ���x
		if(infoReview.get("TOTAL") !=null) {
			total=Double.parseDouble(String.valueOf(infoReview.get("TOTAL"))); 
			count=Double.parseDouble(String.valueOf(infoReview.get("COUNT")));
			//�Ҽ� �Ѥ� �ݿø�
			avg=(double)Math.round((total/count)*100)/100;
			
		}
		mav.addObject("avg", avg);
		
		
		mav.addObject("s",studycafeOne);
		mav.addObject("files",list);


		mav.setViewName("studycafe/studycafeDetail");
		return mav;
	}
	
	
	//���ں�, �뺰,, ����� �ð��� ���� �������ؼ�
	@RequestMapping(value="/studycafe/bookTime")
	@ResponseBody
	public Map<String,String> bookTime(
			@RequestParam(value="studycafe_no", required=false) int studycafe_no,
			@RequestParam(value="studycafe_room", required=false) String studycafe_room,
			@RequestParam(value="book_date", required=false) String book_date,
			@RequestParam(value="studycafe_open", required=false) String studycafe_open,
			@RequestParam(value="studycafe_end", required=false) String studycafe_end					
			){
		
		int startTime=Integer.parseInt(studycafe_open);
		int endTime=Integer.parseInt(studycafe_end);
		
	
		BookTime bookTime = new BookTime();		
		bookTime.setStudycafe_no(studycafe_no);
		bookTime.setStudycafe_room(studycafe_room);
		bookTime.setBook_date(book_date);
				
		
		//�ð����� ������Ȳ �����ϴ� ��
		Map<Integer, String> map=new LinkedHashMap<Integer, String>();
		//������ ��
		Map<String, String> dayInfo=new LinkedHashMap<String, String>();
		//����ð� db ���ڿ�
		String str=studycafeService.getBookTime(bookTime);
		
		//���������ִ�(db���� �ִٸ� 'Y'ó���� ���� ����)
		if(str!=null) {
			String bookTimes[]=str.split("#");
			

			//�⺻ �ð� ���� (�ð�,'N')
			for(;startTime<=endTime;startTime++) {
				map.put(startTime, "N");
			}
			
			//Ű����������
			Set<Integer> keySet=map.keySet();

			for(Integer key:keySet) {		
				// "#09#10.. ������ ����Ǿ��ֱ� ������ �迭�� �ε��� 0�� null���̹Ƿ� 1���ͽ���
				for(int i=1; i<bookTimes.length;i++) {
				
					if(key== Integer.parseInt(bookTimes[i])){

						dayInfo.put(key<10?"0"+key+":00":Integer.toString(key)+":00", "Y");
						break;
					}
					else {

						dayInfo.put(key<10?"0"+key+":00":Integer.toString(key)+":00", "N");
						
					}
					
				}
			}
		
		}else {
			//������ ���� ����! �⺻ �ð� ���� (�ð�,'N')
			for(;startTime<=endTime;startTime++) {
				dayInfo.put(startTime<10?"0"+startTime+":00":Integer.toString(startTime)+":00", "N");
			}
		}
//		for(String key : dayInfo.keySet() ){
//		    String value = dayInfo.get(key);
//		    System.out.println( String.format("Ű : "+key+", �� : "+value));
//		}
		return dayInfo;
	}
	
	
	//����ð� üũ (�߸��� �ð� �����Ҷ�)
	@RequestMapping(value="/studycafe/checkTime")
	@ResponseBody
	public boolean checkTime(
			@RequestParam(value="studycafe_no", required=false) int studycafe_no,
			@RequestParam(value="studycafe_room", required=false) String studycafe_room,
			@RequestParam(value="book_date", required=false) String book_date,
			@RequestParam(value="start_time", required=false) String start_time,
			@RequestParam(value="end_time", required=false) String end_time) {
		
		int startTime=Integer.parseInt(start_time);
		int endTime=Integer.parseInt(end_time);
		
		
		//����ð� ����,���ð� ������ ����(1�ð�)
		if(startTime==0 || endTime ==0) {
			return true;
		}
		else {
			//���ð����� ���۽����� Ŭ��
			if(startTime > endTime || startTime==endTime) {
				return false;
			}
			
			BookTime bookTime = new BookTime();		
			bookTime.setStudycafe_no(studycafe_no);
			bookTime.setStudycafe_room(studycafe_room);
			bookTime.setBook_date(book_date);
			
			String str=studycafeService.getBookTime(bookTime);
			
			
			//������ �ð� ���̿� ����� �ð��� �ִٸ�
			if(str!=null) {
				String bookTimes[]=str.split("#");
				int bookTimeNum[] = new int[bookTimes.length];
				
				for(int i=1;i<bookTimes.length;i++) {
					bookTimeNum[i-1]=Integer.parseInt(bookTimes[i]);
					//System.out.println(bookTimes[i]+"/"+bookTimeNum[i-1]);
				}
				
				for(;startTime<=endTime;startTime++) {
					for(int i=0;i<bookTimeNum.length;i++) {
						if(startTime==bookTimeNum[i]) {
							return false;
						}
					}
				}
					
				
			}//if
			
		}//else
		return true;
	}
	

	//�˻�
	@RequestMapping(value="/studycafe/search")
	@ResponseBody
	public List<Studycafe> search(@RequestParam(value="keyword", required = false) String keyword) {
		List<Studycafe> list = studycafeService.studycafeSearch(keyword);
		return list;
	}
	
	//����������
	@RequestMapping(value="/studycafe/reviewPage")
	public ModelAndView reviewPage(@RequestParam(value="studycafe_no", required=false) int studycafe_no)	{
		ModelAndView mv = new ModelAndView();
		
	Studycafe studycafeOne = studycafeService.getStudycafeOne(studycafe_no);
	//����
	HashMap<String, Object> infoReview =studycafeService.getReviewGrade(studycafe_no);
	
	
	double avg=0;
	double total=0;
	double count=0;
	
	if(infoReview.get("TOTAL") !=null) {
		total=Double.parseDouble(String.valueOf(infoReview.get("TOTAL"))); 
		count=Double.parseDouble(String.valueOf(infoReview.get("COUNT")));
		//�Ҽ� �Ѥ� �ݿø�
		avg=(double)Math.round((total/count)*100)/100;
		
	}
	mv.addObject("avg", avg);
	mv.addObject("count", Math.round(count));
	
	List<StudycafeReview> list = studycafeService.getReviewList(studycafe_no);
	mv.addObject("list",list);
	
	mv.addObject("s",studycafeOne);
	mv.setViewName("studycafe/studycafeReview");

		
		
		 return mv;
	}
	
	//���侲��
	@RequestMapping(value="/studycafe/review")
	@ResponseBody
	public void insertReview(StudycafeReview studycafeReview) {
		System.out.println(studycafeReview);
		//������ �±׷� �ٲ��ִ� ����
		String content =  studycafeReview.getReview_content().replaceAll("\r\n", "<br />");		
		studycafeReview.setReview_content(content);
		
		studycafeService.insertReview(studycafeReview);
		
	}
	
	//��������ϱ�
	@RequestMapping(value="/studycafe/reviewDelete")
	@ResponseBody
	public void reviewDelete(@RequestParam(value="review_no") int review_no) {	
		
		studycafeService.reviewDelete(review_no);
		
	}
	
}
	