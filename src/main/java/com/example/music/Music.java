package com.example.music;

public class Music {
    private String name;
    private String author;
    private String year;
    private string album;
    private String country;

    public String getname() {
        return name;
    }

    public void setname(String name) {
        this.name = name;
    }

    public String getauthor() {
        return author;
    }

    public void setauthor(String author) {
        this.author = author;
    }

    public int getyear() {
        return year;
    }

    public void setyear(int year) {
        this.year = year;
    }

    public String getalbum() {
        return album;
    }

    public void setalbum(String album) {
        this.album = album;
    }

    public String getcountry() {
        return country;
    }

    public void setcountry(String country) {
        this.country = country;
    }

    public Music(String name, String author, int year, String album, String country) {
        this.name = name;
        this.author = author;
        this.year = year;
        this.album = album;
        this.country = country;
    }

    public Music() {
    }

    @Override
    public String toString() {
        return "{" +
                "name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", year='" + year + '\'' +
                ", album=" + album +
                ", country='" + country + '\'' +
                '}';
    }
}
