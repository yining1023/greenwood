import java.util.Map;

float nyX, nyY;
float[] x = new float[15];
ArrayList<Country> countries = new ArrayList<Country>();

void setup() {
  size (1280, 720, P3D);
  smooth(4);
  background(0);
  loadData();
}

void loadData() {
  
  Table myTable1 = loadTable("Position.csv", "header");

  for (int i = 0; i < myTable1.getRowCount (); i++) {
    TableRow row= myTable1.getRow(i);

    int pos = row.getInt("Long");
    String country = row.getString("Location");
    x[i] = map(pos, -5, 5, 100, width - 100);

    noStroke();
    fill(255);
    ellipse(x[i], 600, 15, 15);
    strokeWeight(1);
    stroke(255);
    //line(x[i], 600, x[i], 200 - i* 16);
    PFont myFont = createFont("Helvatica", 10);
    textFont(myFont);
    textSize(18);
    text(country, x[i] - textWidth(country)/2, height - 70);
    countries.add(new Country(x[i], 600, random(360), 0));
  }

  Table myTable = loadTable("GreenWood.csv", "header"); // declaring it locally, this name can be used in other functions as well
  nyX = width/2;
  nyY = height/2;
    
  
  for (int i =0; i <myTable.getRowCount(); i++) {
    TableRow row = myTable.getRow(i);
    String affiliation = row.getString("Birthplace");// or type this String affiliation = myTable.getString(6)("Union or Confederate");
    //String side = row.getString("Union or Confederate");

    noFill();
    if (affiliation != null) {
      if (affiliation.equals("Canada"))
        countries.get(1).total++;
        
      else if (affiliation.equals("Ireland"))
        countries.get(2).total++;
        
      else if (affiliation.equals("Holland") || affiliation.equals("Amesterdam Holland")) 
        countries.get(3).total++;
      else if (affiliation.equals("Austria") || affiliation.equals("Vienna, Austria") 
      || affiliation.equals("Silesia, Austria")) 
        countries.get(4).total++;
      else if (affiliation.equals("Italy") || affiliation.equals("Naples, Italy") 
      || affiliation.equals("Florence, Italy")) 
        countries.get(5).total++;
      else if (affiliation.equals("France") || affiliation.equals("Florence, Italy")
      || affiliation.equals("Baccarat, France") || affiliation.equals("Saar-Union, Alsace, France"))
        countries.get(6).total++;
      else if (affiliation.equals("Spain")||affiliation.equals("Grenada, Spain")||affiliation.equals("Minorca, Spain"))
        countries.get(7).total++;
      else if (affiliation.equals("Germany"))
        countries.get(8).total++;
      else if (affiliation.equals("Scotland")
      )
        countries.get(9).total++;
      else if (affiliation.equals("England")) 
        countries.get(10).total++;
    }
  }
  // for(int j=1; j < 11; j++){
  //   countries.get(j).X = width/2 + 550*cos(j*TWO_PI/10);
  //   countries.get(j).Y = height/2 + 550*sin(j*TWO_PI/10);
  //   println(countries.get(j).X + " , "  + countries.get(j).Y );
  // }
  
  for (Country c: countries){
     for(int i = 0; i < c.total; i++){
      drawBezier(c.X, c.Y, i, c.hue, 3.1);
     }
     // for (int i = 1; i < 15; i++){
     // text(c.total, x[i] - textWidth(str(c.total))/2, height - 50);
     // }
  }
}

void drawBezier(float cX, float cY, float n, float hue, float bHeight){
  float normalized_n = map(n, 0, 1000, 0, height-200);
  float saturation = map(n, 0, 1000, 50, 100);
  
  colorMode(HSB, 360, 100, 100, 100);
  //float sw = map(n, 0, 1000, 5, 50);
  strokeWeight(1);
  stroke(hue, saturation, 95, 70);
  bezier(cX, cY, cX, cY - normalized_n*bHeight, nyX, nyY - normalized_n*bHeight, nyX, nyY);
}
