package spo.tis.service;

import java.util.List;

import spo.tis.domain.CPictureVO;

public interface CPictureService {

	List<CPictureVO> getClubPicture(int cno);

	List<CPictureVO> getMyPicture(CPictureVO cpvo);

	int deletePhoto(int cpno);

	int insertPhoto(CPictureVO cpicture);

}
