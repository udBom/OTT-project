package com.ezen.biz.ott;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.OttDAO;
import com.ezen.biz.dto.FavoriteVO;
import com.ezen.biz.dto.OttVO;
import com.ezen.biz.dto.UserVO;


@Service("ottServices")
public class OttServiceImpl implements OttService{

	@Autowired
	private OttDAO oDao;
	
	
	public OttServiceImpl() {

	}
	
	//관리자
	
	// 작품 등록
	@Override
	public void insertOtt(OttVO ott) {
		oDao.insertOtt(ott);

	}
	
	// 작품 목록
	@Override
	public List<OttVO> ad_getOttList(OttVO ott) {

		return oDao.ad_getOttList(ott);
	}

	// 작품 수정
	@Override
	public void updateOtt(OttVO ott) {
		oDao.updateOtt(ott);

	}

	// 작품 삭제
	@Override
	public void deleteOtt(OttVO ott) {
		oDao.deleteOtt(ott);
	}

	// 작품 상세정보
	@Override
	public OttVO getOtt(OttVO ott) {
		oDao.upCnt(ott);
		return oDao.getOtt(ott);
	}
	
	
	
	
	
	
	@Override
	public int getFav(FavoriteVO favVo) {
		return oDao.findFav(favVo);
	}
	
	@Override
	public int setFav(FavoriteVO favVo) {
		int result = 0;
		int tmp = oDao.findFav(favVo);
		if(tmp == 0) {
			result = oDao.insFav(favVo);
		} else {
			oDao.delFav(favVo);
		}
		return result; 
	}
	
	@Override
	public List<OttVO> getOttList(OttVO ott) {

		return oDao.getOttList(ott);
	}
	
	@Override
	public List<OttVO> getOttDramaList(OttVO ott) {

		return oDao.getOttDramaList(ott);
	}

	
	@Override
	public List<OttVO> getOttActionList(OttVO ott) {

		return oDao.getOttActionList(ott);
	}
	
	@Override
	public List<OttVO> getOttRomanceList(OttVO ott) {

		return oDao.getOttRomanceList(ott);
	}
	
	@Override
	public List<OttVO> getFavoriteList(FavoriteVO vo) {

		return oDao.getFavoriteList(vo);
	}

	
	@Override
	public UserVO getUser(UserVO vo) {
		return oDao.getUser(vo);
	}
	@Override
	public void insertUser(UserVO vo) {
		oDao.insertUser(vo);
	}
	@Override
	public UserVO idCheck(String id){
		return oDao.idCheck(id);
	}
	

		
	
}
