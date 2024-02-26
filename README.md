# Stubs
A SwiftUI app for storing digital representations of concert ticket stubs. The ticket stub data is used to search for venues on a map, and query related artist details, like images, biography, and discography. 

<b>Stubs</b> benefits from:
* SwiftData for persistence
* MapKit updates for SwiftUI
* Animated SF Symbols
* New ScrollView APIs
* Data from [TheAudioDB](https://www.theaudiodb.com) via [RapidAPI](https://rapidapi.com/hub)

<b>Notice:</b> An API key from RapidAPI is required to run the app with a complete experience. Sign up for free [here](https://rapidapi.com/auth/sign-up).

## StubCollection
![Stubs Showcase 001](https://github.com/bodhichristian/Stubs/assets/110639779/dd11dc51-bd03-45ad-9a9f-1751bcc83da3)
At the heart of the app is adding a Stub. Users may record details such as artist name, venue, and city, customize their ticket color and icon, and store notes about attended concerts. When a user attemtps to save a stub, MapKit fetches venue coordinate data, and artist details are fetched from TheAudioDB. Stubs, along with related artist info and image data are persisted with SwiftData. 
* <b>StubCollection </b> is the view that launches with the app. It provides a button to create a new stub, and presents users a list of their saved concerts. This list is searchable by most data available to the concert, and users may filter their favorites for quick reference.
* <b>StubDetailsView </b> celebrates the concert with large scale stub, ability to view the venue on a map, favorite or delete the concert, or even edit the notes. Users may also access additional stubs by the same artist.

   
## ArtistsView
![Stubs Showcase 2:26 2 001](https://github.com/bodhichristian/Stubs/assets/110639779/f5954405-29e5-4bb1-b31b-36702df47630)
When a Stub is added, the artist is displayed on a list in ArtistsView. Users may toggle a grid view that transitions in with a matched geometry effect. ArtistDetailsView presents a rich artist experience with profile and banner images, an expandable bio, interactive map, additional stubs, and discography. 
