---
title:  "Spring - Just Run Won't You"
date:   "2018-10-05"
categories: [code]
tags: [spring]
---

I needed to make a service to be called and start running immediately.  I could call it a cron job or a jar file.  The issue was the entry point. In a normal service, the server starts and the controllers are exposed and code happens once the endpoints in the controller are hit. But how to design when no controller?  

Here's a solution I used:

@SpringBootApplication
public class CatApplication {

	@Autowired
	private Service service;
	
	public static void main(String[] args) {
		SpringApplication.run(CatApplication.class, args);
	}
	
	@PostConstruct
	public void init() {
		service.run();
	}
}
