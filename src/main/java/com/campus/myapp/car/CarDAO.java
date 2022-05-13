package com.campus.myapp.car;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CarDAO {
	public int carWriteOk(CarVO vo);
}
