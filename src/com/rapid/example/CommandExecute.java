package com.rapid.example;

import cn.org.rapid_framework.generator.GeneratorFacade;

public class CommandExecute {
	public static void main(String[] args) {
		GeneratorFacade gf = new GeneratorFacade();
		String templateRootDir = "WebRoot/template";
		String table = "t_user_info";
		try {
			gf.g.setIncludes("sdkadminEasyUi/**");//只使用sdkadmin文件夹下的模版
			System.setProperty("gg.isOverride", "true");
			//gf.deleteByTable(table, templateRootDir);//删除时注释下面一行
			gf.generateByTable(table, templateRootDir);//生成时注释上面一行
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
