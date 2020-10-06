package spo.tis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import spo.tis.domain.CPictureVO;
import spo.tis.mapper.CPictureMapper;

@Service
public class CPictureServiceImpl implements CPictureService {

	@Inject
	CPictureMapper cpictureMapper;
	
	@Override
	public List<CPictureVO> getClubPicture(int cno) {
		
		return cpictureMapper.getClubPicture(cno);
	}

	@Override
	public List<CPictureVO> getMyPicture(CPictureVO cpvo) {
		
		return cpictureMapper.getMyPicture(cpvo);
	}

	@Override
	public int deletePhoto(int cpno) {
	
		return cpictureMapper.deletePhoto(cpno);
	}

	@Override
	public int insertPhoto(CPictureVO cpicture) {
		
		return cpictureMapper.insertPhoto(cpicture);
	}

}
