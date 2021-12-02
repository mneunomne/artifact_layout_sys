public class PandemicArchiveOfVoices {
  String server_url = "https://pandemic-archive-of-voices.herokuapp.com";
  //String server_url = "http://localhost:3000";
  
  String getAudioAsText_path = "/api/get_audio_samples_characters/audio_id/8/8000";
  String getData_path = "/api/data";
  
  PandemicArchiveOfVoices () {
    // loadDatabase();
  }

  void getDatabaseData () {
    // get database data from api
    GetRequest get = new GetRequest(server_url + "/api/data");
    get.send();
    get.addHeader("Accept", "application/json");
    JSONObject json = parseJSONObject(get.getContent());
  }
  
  
  String getAudioAsText (int audio_id) {
    String text = "";
    
    String path = getAudioAsText_path.replace("audio_id", Integer.toString(audio_id));
    
    println("path", path);
    
    GetRequest get = new GetRequest(server_url + path);
    get.send();
    get.addHeader("Accept", "text/plain");
    text= get.getContent();
    return text;
  }
}
