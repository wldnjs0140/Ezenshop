package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.shop.dto.ReviewDto;
import com.shop.dto.ReviewImgDto;

@Mapper
public interface ReviewDao {

	// 리뷰 전체 리스트 출력
	@Select("select * from review order by num desc")
	public List<ReviewDto> reviewListAll();
	
	// 특정 상품 리뷰 리스트 출력
	@Select("select * from review where goodsCode=#{param1}")
	public List<ReviewDto> reviewList(String goodsCode);
	
	// 리뷰등록
	@Insert("insert into review (goodsCode,goodsName,reStar,uname,weight,height,goodsSize,goodsColor,reContent,ref)"
			+ " values (#{_goodsCode},#{_goodsName} ,#{_reStar}, #{_uname}, #{_weight}, #{_height}, #{_goodsSize}, #{_goodsColor}, #{_reContent}, #{_ref})")
	public void reviewAdd(Map<String, Object> map);
	
	// 리뷰사진등록
	@Insert("insert into reviewImg (goodsCode,uname,filename,oriFilename,filesize,ref) values "
			+ "(#{goodsCode}, #{uname}, #{filename}, #{oriFilename}, #{filesize}, ${ref})")
	public void reviewImgAdd(Map<String, Object> map);
	
	// 리뷰수정시 리스트
	@Select("select * from review where ref = #{param1}")
	public List<ReviewDto> modList(int ref);
	@Select("select * from reviewImg where ref = #{param1}")
	public List<ReviewImgDto> modImgList(int ref);
	
	// 리뷰 수정
	@Update("update review set reContent=#{reContent}, height=#{height}, weight=#{weight}, reStar=#{reStar}  "
			+ "where ref=#{ref}")
	public void modProc(Map<String, Object> map);
	@Delete("delete from reviewImg where ref=#{param1}")
	public void modDel(int ref);
	
	// 리뷰 사진 가져오기
	@Select("select * from reviewImg where goodsCode=#{param1}")
	public List<ReviewImgDto> callImg(String goodsCode);
	
	// 초기 ref 값 설정
	@Select("select max(num) from review")
	public int refIniSet();
	
	// 리뷰 삭제
	@Delete("delete from review where ref=#{param1}")
	public int delRev(int ref);
	@Update("update review set ref=(#{param1 - 1}) where ref>#{param1}")
	public int upRef(int ref);	// ref 값 조정
	@Delete("delete from reviewImg where ref=#{param1}")
	public int derRevImg(int ref);
	
	// 상품 리뷰 개수
	@Select("select count(goodsCode) from review where goodsCode=#{param1}")
	public int reviewCnt(String goodsCode);
}
