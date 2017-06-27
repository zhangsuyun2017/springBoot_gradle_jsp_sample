# springBoot_gradle_jsp_sample

1）简单的使用gradle+springboot+jsp的使用；

2）可以打jar包，也可以打war包，打jar使用的启动类配置如下：

@SpringBootApplication
public class App {

	public static void main(String[] args) {
		SpringApplication.run(App.class, args);
	}
}

使用war包的启动类配置如下：

@SpringBootApplication
public class App extends SpringBootServletInitializer {
	
	  @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(App.class);
    }
    
}
