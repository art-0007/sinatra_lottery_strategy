<h2>Create New Figure</h2>

<!-- add content here -->
<form action="/figures" method="POST">
  <label>Figure Name:</label>
  <br>
  <input type="text" name="figure[name]" id = "figure_name">
<br>
<p>Select an existing title or create a new one below.</p>

  <h3>Existing Titles:</h3>
  <% @titles.each do |t| %>
    <input type="checkbox" name="figure[title_ids][]" id=" title_ <%="#{t.id}"%>" value="<%= t.id %>"><%= t.name %></input>
  <% end %>
  <br>

  <h3>New Title</h3>
  <label>Title: </label>
  
  <br>
  <input type="text" name="title[name]" id="new_title"></input>
  <br><br>

<p>Select an existing landmark or create a new one below.</p>

  <h3>Existing Landmarks:</h3>
  <% @landmarks.each do |l| %>
    <input type="checkbox" name="figure[landmark_ids][]" id="landmark_ <%="#{l.id}"%>" value="<%= l.id %>"><%= l.name %></input>
  <% end %>
  <br>

  <h3>New Landmark</h3>
  <label>Landmark: </label>
  
  <br>
  <input type="text" name="landmark[name]" id="new_landmark"></input>
  <br><br>

  <input type="submit" value="Create Lendmark" id = "Create new Figure">
</form>


<a class="button" href="/landmarks">Landmarks</a>
<a class="button" href="/">Home</a>