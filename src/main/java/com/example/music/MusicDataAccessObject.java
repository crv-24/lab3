package com.example.music;



import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class MusicDataAccessObject {
    private File file;
    private ObjectMapper objectMapper;

    public MusicDataAccessObject(String fileName) {
        file = new File(fileName);
        objectMapper = new ObjectMapper();
    }

    public List<music> getAllmusic() {
        List<music> music = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                music music = objectMapper.readValue(line, music.class);
                music.add(music);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return music;
    }

    public boolean addmusic(music music) {
        try (FileWriter writer = new FileWriter(file, true)) {
            String json = objectMapper.writeValueAsString(music);
            writer.write(json + "\n");
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}