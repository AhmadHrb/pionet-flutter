# Pionet

Planned flutter app to help people learn various piano music!

*work in progress to be published, backup incase the development stops*

## How it works

For the buttons it's a for loop with number of buttons based on `width/size of button` to limit buttons to screen. each button added has an id added to `theColor` which controls the button color in addition to each button being added to a list of same type buttons like `Do,Ri,Me,...` to get the required button later.

To get the best button to play a piano, we use th get nearest function which is based on `Do[((Do.length-1)/2)` which is getting the total `Do` buttons dividing them by 2 and getting it's id from the Do object then using that id in the `theColor` list.

Clicking a button as of now is changing the container color from white to grey for 0.1s then changing it back to white.

Playing a music, is looping in the music buttons and getting the nearest button and clicking it.

![image](https://user-images.githubusercontent.com/34627272/212766934-7de5a535-69d1-41e2-8647-002ef8b4acc2.png)

### Todo:

* Button sound on click (Do,Re,...)

* Get music notes via API based on Git repo.

* Home screen to choose and search for the music you want.

* Improve the design.

* And more...
