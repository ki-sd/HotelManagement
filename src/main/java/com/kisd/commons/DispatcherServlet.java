package com.kisd.commons;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.lang.reflect.Method;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.net.*;

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<String> clsList=new ArrayList<String>();

	private Map<String,Object> handlerMappingMap=new HashMap<>();
	private Map<String,Method> handlerMethodMap=new HashMap<>();

	public void init(ServletConfig config) throws ServletException {
		try {
			URL url=this.getClass().getClassLoader().getResource(".");
			File file=new File(url.toURI());
//			String path=file.getPath().replace("\\", File.separator);
//			path=path.substring(0,path.lastIndexOf(File.separator))+File.separator+"application.xml";
			InputStream is = this.getClass().getClassLoader().getResourceAsStream("application.xml");

			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			DocumentBuilder db=dbf.newDocumentBuilder();
//			Document doc=db.parse(new File(path));
			Document doc=db.parse(is);
			Element beans=doc.getDocumentElement();
			NodeList list=doc.getElementsByTagName("component-scan");
			String pack="";
			for(int i=0;i<list.getLength();i++) {
				Element elem=(Element)list.item(i);
				pack=elem.getAttribute("basepackage");
			}
			clsList=ComponentScan.componentScan(file.getPath(), pack);

			for(String cls:clsList){
				Class<?> clsName=Class.forName(cls);
				if(!clsName.isAnnotationPresent(Controller.class)) continue;

				Object obj=clsName.getDeclaredConstructor().newInstance();
				Method[] methods=clsName.getDeclaredMethods();

				for(Method m:methods){
					if(m.isAnnotationPresent(RequestMapping.class)){
						RequestMapping rm=m.getAnnotation(RequestMapping.class);
						String uri=rm.value();

						handlerMappingMap.put(uri,obj);
						handlerMethodMap.put(uri,m);
					}
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		if (uri.startsWith("/")) {
			uri = uri.substring(1);
		}

		if (uri.contains(";")) {
			uri = uri.substring(0, uri.indexOf(";"));
		}

		try {
			Object obj=handlerMappingMap.get(uri);
			Method m=handlerMethodMap.get(uri);

			if(obj==null || m==null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}

			String jsp=(String)m.invoke(obj, request, response);

			if (jsp != null) {
				if (jsp.startsWith("redirect:")) {
					jsp = jsp.substring(jsp.indexOf(":")+1);
					if (jsp.startsWith("/")) {
						response.sendRedirect(request.getContextPath() + jsp);
					} else {
						response.sendRedirect(jsp);
					}
				} else {
					RequestDispatcher rd = request.getRequestDispatcher(jsp);
					rd.forward(request, response);
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
