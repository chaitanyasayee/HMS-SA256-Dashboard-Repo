package com.browser.Interface;

import com.browser.Bean.RegisterBean;
import com.browser.Bean.UploadBean;

public interface BrowserInterface {
	
	public int register(RegisterBean rb);
	public int login(String email, String password);
	
	public int fileupload(UploadBean ub);

}
