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
					String returnp = "�ɹ�Ϊһ��ѡ������һƱ~~~";
					fightService.addRecord(userid, player, i);
					return returnp;

					// return "���Ѿ�Ͷ��һƱ����";

				} else {
					return "ͶƱʧ��";
				}

			} else {
				return "���Ѿ�Ͷ��һƱ����";
			}

		} else {

			VoteRecord voteRecord = new VoteRecord();
			voteRecord.setFight(i);
			voteRecord.setUserid(userid);
			boolean iii = fightService.Isduplicate(voteRecord);
			if (iii) {
				int ii = fightService.updataticket2(i);
				if (ii > 0) {
					String returnp = "�ɹ�Ϊ����ѡ������һƱ~~~";
					fightService.addRecord(userid, player, i);
					return returnp;
				} else {
					return "ͶƱʧ��";
				}
			} else {
				return "���Ѿ�Ͷ��һƱ����";
			}

		}

	}

}
