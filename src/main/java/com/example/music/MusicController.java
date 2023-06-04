package com.example.music;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class MusicController extends HttpServlet {
    private MusicDataAccessObject MusicDAO;
    private ObjectMapper objectMapper;

    public MusicController() {
        MusicDAO = new MusicDataAccessObject("Music.json");
        objectMapper = new ObjectMapper();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Music> Music = MusicDAO.getAllMusic();
        String json = objectMapper.writeValueAsString(Music);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String author = req.getParameter("author");
        int year = req.getParameter("year");
        String album = Integer.parseInt(req.getParameter("album"));
        String country = req.getParameter("country");

        Music Music = new Music(name, author, year, album, country);
        boolean success = MusicDAO.addMusic(Music);

        String json = objectMapper.writeValueAsString(success);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }
}

