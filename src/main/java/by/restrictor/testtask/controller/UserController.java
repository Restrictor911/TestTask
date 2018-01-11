package by.restrictor.testtask.controller;

import by.restrictor.testtask.model.Paginator;
import by.restrictor.testtask.model.User;
import by.restrictor.testtask.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * Created by Restrictor on 17.05.2016.
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;
    Paginator paginator;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String root(Model model) {
        paginator = new Paginator(userService.countPages());
        model.addAttribute("paginator", paginator);
        model.addAttribute("user", new User());
        model.addAttribute("users", this.userService.listUsers(0));
        return "main";
    }

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(Model model) {
        paginator = new Paginator(userService.countPages());
        model.addAttribute("paginator", paginator);
        model.addAttribute("user", new User());
        model.addAttribute("users", this.userService.listUsers(0));
        return "main";
    }

    @RequestMapping(value = "/main/{page}", method = RequestMethod.GET)
    public String navMain(@PathVariable int page, Model model) {
        paginator.setCurrentPage(page);
        model.addAttribute("paginator", paginator);
        model.addAttribute("user", new User());
        model.addAttribute("users", this.userService.listUsers(page));
        return "main";
    }

    @RequestMapping(value = "userinfo/{id}")
    public String userInfo(@PathVariable int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "userinfo";
    }

    @RequestMapping(value = "/add")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "form";
    }

    @RequestMapping(value = "/form/update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("user") User user,
                         BindingResult result) {
        if (result.hasErrors()) {
            return "form";
        }
        if (user.getId() == 0) {
            this.userService.addUser(user);
            return "redirect:/main";
        } else {
            this.userService.updateUser(user);
            return "redirect:/userinfo/" + user.getId();
        }
    }

    @RequestMapping(value = "userinfo/edit/{id}")
    public String edit(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "form";
    }

    @RequestMapping(value = "userinfo/remove/{id}")
    public String remove(@PathVariable("id") int id){
        this.userService.removeUser(id);

        return "redirect:/main";
    }

    @RequestMapping(value = "/search")
    public String search(@ModelAttribute("user") User user, Model model){
        if (user.getName().equals("")) return "redirect:main";
        paginator = new Paginator(userService.countPages(user.getName()));
        paginator.setMode("search");
        model.addAttribute("paginator", paginator);
        model.addAttribute("user", user);
        model.addAttribute("users",
                this.userService.getUsersByName(user.getName(), 0));

        return "main";
    }

    @RequestMapping(value = "/search/{page}")
    public String navSearch(@PathVariable("page") int page,
                            @RequestParam("name") String name,
                            Model model){
        paginator.setCurrentPage(page);
        User user = new User();
        user.setName(name);
        model.addAttribute("paginator", paginator);
        model.addAttribute("user", user);
        model.addAttribute("users",
                this.userService.getUsersByName(name, page));

        return "main";
    }
}
