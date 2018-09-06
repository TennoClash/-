package Shixun2018.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Shixun2018.entity.QueryFight;
import Shixun2018.entity.VoteRecord;
import Shixun2018.service.FightService;

@Controller
public class TicketController {
	@Autowired
	private FightService fightService;

	@RequestMapping("/ticket")
	public String ticketpage(Model model) {
		QueryFight queryFight = fightService.queryFight();
		model.addAttribute("queryFight", queryFight);
		return "ticket";
	}

	@RequestMapping("/ticketPlus")
	@ResponseBody
	public String ticketplus(int i, int mark, int userid, int player) {
		if (mark == 1) {
			VoteRecord voteRecord = new VoteRecord();
			voteRecord.setFight(i);
			voteRecord.setUserid(userid);
			boolean iii = fightService.Isduplicate(voteRecord);
			if (iii) {
				int ii = fightService.updataticket1(i);
				if (ii > 0) {
					String returnp = "成功为一号选手添上一票~~~";
					fightService.addRecord(userid, player, i);
					return returnp;

					// return "你已经投过一票了噢";

				} else {
					return "投票失败";
				}

			} else {
				return "你已经投过一票了噢";
			}

		} else {

			VoteRecord voteRecord = new VoteRecord();
			voteRecord.setFight(i);
			voteRecord.setUserid(userid);
			boolean iii = fightService.Isduplicate(voteRecord);
			if (iii) {
				int ii = fightService.updataticket2(i);
				if (ii > 0) {
					String returnp = "成功为二号选手添上一票~~~";
					fightService.addRecord(userid, player, i);
					return returnp;
				} else {
					return "投票失败";
				}
			} else {
				return "你已经投过一票了噢";
			}

		}

	}

}
