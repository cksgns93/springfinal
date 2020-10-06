package spo.tis.mapper;

import java.util.List;

import spo.tis.domain.CPictureVO;

public interface CPictureMapper {

	List<CPictureVO> getClubPicture(int cno);

	List<CPictureVO> getMyPicture(CPictureVO cpvo);

	int deletePhoto(int cpno);

	int insertPhoto(CPictureVO cpicture);

}
