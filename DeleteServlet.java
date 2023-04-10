package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.pack1.Note;

import Helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int note_Id = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
			Note note = s.get(Note.class, note_Id);
			s.delete(note);
           tx.commit();
			s.close();
			// after delete all other notes will get back to there respective position
			response.sendRedirect("all_notes.jsp");

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
