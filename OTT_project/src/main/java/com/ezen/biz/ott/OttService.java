package com.ezen.biz.ott;

import java.util.List;

import com.ezen.biz.dto.FavoriteVO;
import com.ezen.biz.dto.OttVO;
import com.ezen.biz.dto.UserVO;

public interface OttService {
	
	//관리자
	
	// 작품 등록
	void insertOtt(OttVO ott);
	// 작품 목록 조회
	List<OttVO> ad_getOttList(OttVO ott);
	// 작품 수정
	void updateOtt(OttVO ott);
	// 작품 삭제
	void deleteOtt(OttVO ott);
	// 작품 상세정보
	OttVO getOtt(OttVO ott);
	
	
	
	
	int getFav(FavoriteVO favVo);
	int setFav(FavoriteVO favVo);
	
	public List<OttVO> getOttList(OttVO ott) ;
	public List<OttVO> getOttDramaList(OttVO ott) ; //드라마 장르
	public List<OttVO> getOttActionList(OttVO ott) ; //액션 장르
	public List<OttVO> getOttRomanceList(OttVO ott) ; //코미디 장르
	public List<OttVO> getFavoriteList(FavoriteVO ott) ; //즐겨찾기 받아오기
	
	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);
	UserVO idCheck(String id);
	

	
	
	
 }
