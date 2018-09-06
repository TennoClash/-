package Shixun2018.controller;
import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import util.FileUploadUtil;
import util.ImgCut;

@Controller 
@RequestMapping("/Shixun2018")
public class UploadImgController {

    @RequestMapping(value = "/uploadHeadImage",method = RequestMethod.POST)
    public String uploadHeadImage(
            HttpServletRequest request,
            @RequestParam(value = "x") String x,
            @RequestParam(value = "y") String y,
            @RequestParam(value = "h") String h,
            @RequestParam(value = "w") String w,
            @RequestParam(value = "imgFile") MultipartFile imageFile
    ) throws Exception{
        System.out.println("==========Start=============");
        String realPath = request.getSession().getServletContext().getRealPath("/");
        String resourcePath = "/Shixun2018/img/uploadImages/";
        if(imageFile!=null){
            if(FileUploadUtil.allowUpload(imageFile.getContentType())){
                String fileName = FileUploadUtil.rename(imageFile.getOriginalFilename());
                int end = fileName.lastIndexOf(".");
                String saveName = fileName.substring(0,end);
                File dir = new File(realPath + resourcePath);
                if(!dir.exists()){
                    dir.mkdirs();
                }
                File file = new File(dir,saveName+"_src.jpg");
                imageFile.transferTo(file);
                String srcImagePath = realPath + resourcePath + saveName;
                int imageX = Integer.parseInt(x);
                int imageY = Integer.parseInt(y);
                int imageH = Integer.parseInt(h);
                int imageW = Integer.parseInt(w);
                //���￪ʼ��ȡ����
                System.out.println("==========imageCutStart=============");
                ImgCut.imgCut(srcImagePath,imageX,imageY,imageW,imageH);
                System.out.println("==========imageCutEnd=============");
                request.getSession().setAttribute("imgSrc",resourcePath + saveName+"_src.jpg");//�ɹ�֮����ʾ��
                request.getSession().setAttribute("imgCut",resourcePath + saveName+"_cut.jpg");//�ɹ�֮����ʾ��
            }
        }
        return "success";
    }

}
