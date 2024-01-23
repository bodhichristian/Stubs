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
At the heart of the app is adding a Stub. Users may record details such as artist name, venue, and city, customize their ticket color and icon, and store notes about attended concerts. When a user attemtps to save a stub, MapKit fetches venue coordinate data, and artist details are fetched from TheAudioDB. Stubs, along with related artist info and image data are persisted wjth SwiftData. 

## ArtistsView
![Stubs Showcase 002](https://github.com/bodhichristian/Stubs/assets/110639779/657fbce2-67a0-490a-87a5-2c9e9da70659)
When a Stub is added, the artist is displayed on a list in ArtistsView. Users may toggle a grid view that transitions in with a .matchedGeometryEffect. ArtistDetailsView presents a rich artist experience with profile and banner images, an expandable bio, intersctive map, additional stubs, and discography. 
