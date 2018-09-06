package Shixun2018.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Shixun2018.entity.Fight;
import Shixun2018.entity.Player;
import Shixun2018.service.FightService;
import Shixun2018.service.PlayerService;
import sun.net.www.content.text.plain;

@Controller
public class PmController {
	@Autowired
	private PlayerService playerService;
	@Autowired
	private FightService fightService;
	
	@RequestMapping(value="/upload_submit",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String fileUpload(@RequestParam("file") MultipartFile file,HttpServletRequest request)
			throws IOException {
		String filename = file.getOriginalFilename();
		String path = request.getServletContext().getRealPath("/files/")+ filename;
		File f = new File(path);
		if(!f.getParentFile().exists()){
			f.getParentFile().mkdirs();
		}
		file.transferTo(f);
/*		ModelAndView mv = new ModelAndView("download");
		mv.addObject("filename", filename);
				String uripath="/Shixun2018/files/"+filename;
				mv.addObject("uripath", uripath);*/

		return "1";
	}
	@RequestMapping(value="/addplayer",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String add(Player player){
		int i=playerService.addPlayer(player);
		if(i>0){
			return "1";
		}else {
			return "2";
		}
	}
	
	@RequestMapping(value="/manage",produces="text/html;charset=UTF-8")
	public String playerList(Model model){
		List<Player> list=playerService.getPlayers();
		List<Fight> list2=fightService.fightList();
		model.addAttribute("player",list);
		model.addAttribute("fight", list2);
		return "manage";
	}
}
