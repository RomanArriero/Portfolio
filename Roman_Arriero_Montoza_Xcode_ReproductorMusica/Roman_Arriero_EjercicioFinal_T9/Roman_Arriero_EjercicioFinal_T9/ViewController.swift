//
//  ViewController.swift
//  Roman_Arriero_EjercicioFinal_T9
//
//  Created by user176695 on 15/11/2020.
//

import UIKit

//ponemos el delegado y el DataSource de la tabla.
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlet de la tabla.
    @IBOutlet var table: UITableView!
    
    //array de canciones
    var songs = [Song]()
    
    //variable label volumen.
    public let volume: String = "Volumen"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSongs()
        
        //el delegado y el dataSource es él mismo.
        table.delegate = self
        table.dataSource = self
        
    }
    //funcion para agregar los elementos de las canciones.
    func configureSongs() {
        songs.append(Song(name: "Barcelonian",
                          albumName: "Peace",
                          artistName: "Vista Chino",
                          imageName: "cover1",
                          trackName: "song1"))
        
        songs.append(Song(name: "I Sat By The Ocean",
                          albumName: "...Like Clockwork",
                          artistName: "Queens of the Stone Age",
                          imageName: "cover2",
                          trackName: "song2"))
        
        songs.append(Song(name: "Just a man",
                          albumName: "King For A Day",
                          artistName: "Faith No More",
                          imageName: "cover3",
                          trackName: "song3"))
        
        songs.append(Song(name: "Black Coffee",
                          albumName: "Eat At Whitey's",
                          artistName: "Everlast",
                          imageName: "cover4",
                          trackName: "song4"))
        
        songs.append(Song(name: "I Wonder",
                          albumName: "Blind Melon",
                          artistName: "Blind Melon",
                          imageName: "cover5",
                          trackName: "song5"))
        
        songs.append(Song(name: "Judith",
                          albumName: "Mer de Noms",
                          artistName: "A Perfect Circle",
                          imageName: "cover6",
                          trackName: "song6"))
    }
    
    //Tabla
    //implemento las funciones de la tabal.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //devuelve el array de songs.
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let song = songs[indexPath.row]
        
        //configuracion de la celda, con los textos y las imagenes.
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        
        //tipo de letra y tamaño para los labels de la tabla.
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 16)
        
        //color de las celdas.
        cell.backgroundColor = indexPath.row % 2 == 0 ? .black : .white
        cell.textLabel?.textColor = indexPath.row % 2 == 0 ? .white : .black
        cell.detailTextLabel?.textColor = indexPath.row % 2 == 0 ? .white : .black
        
        return cell
    }
    
    //tamaño de la celda personalizada.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //selección de una fila determinada
        tableView.deselectRow(at: indexPath, animated: true)
        
        //mostramos el reproductor
        let position = indexPath.row
        //canciones
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        
        present(vc, animated: true)
    }
    
}

//estructura de las canciones. Variables.
struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
    
}

