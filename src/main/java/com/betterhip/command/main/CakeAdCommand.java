package com.betterhip.command.main;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.betterhip.command.BetterhipCommand;
import com.betterhip.dao.main.CakeAdDao;
import com.betterhip.dto.main.CakeAdDto;

public class CakeAdCommand implements BetterhipCommand {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		CakeAdDao dao = new CakeAdDao();
		ArrayList<CakeAdDto> adDtos = dao.cakead();
		request.setAttribute("list", adDtos);

	}

}
