package com.mo.controller;
import com.mo.entity.Diabetes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;


@Controller
public class MoController {
    @RequestMapping(value = "/T", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public String goT(HttpServletRequest request, @ModelAttribute("T") Diabetes T) {
        System.out.println(T.getAge() + "ttttttt" + T.getBloodpressure());
        SparkML sp = new SparkML();
        double pro = sp.sparkML(T.getPregnancies(), T.getGlucose(), T.getBloodpressure(), T.getSkinthickness(), T.getInsulin(), T.getBmi(), T.getDiabetespedigreefunction(), T.getAge());
        if (pro == 1) {
            request.setAttribute("ill", "你得糖尿病了，概率高达100%");
        } else {
            request.setAttribute("ill", "你没得糖尿病");
        }

        return "predicte";
    }
}
