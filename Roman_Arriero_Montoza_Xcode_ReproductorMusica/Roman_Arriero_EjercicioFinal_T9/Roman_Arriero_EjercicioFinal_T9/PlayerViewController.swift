//
//  PlayerViewController.swift
//  Roman_Arriero_EjercicioFinal_T9
//
//  Created by user176695 on 15/11/2020.
//

import UIKit
//importamos esta biblioteca para la reproduccion video/audio.
import AVFoundation
import AVKit

class PlayerViewController: UIViewController {
    
    //posicion de la cancion seleccionada.
    public var position: Int = 0
    //array de las canciones.
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!
    
    //instancia para manejar el reproductor.
    var player: AVAudioPlayer?
    
    //imagenes de interface de usuario
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    //label nombre cancion interface usuario.
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    //label nombre grupo interface usuario.
    private var artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    //label nombre album interface usuario.
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    //label volumen.
    private let volume: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 35)
        return label
    }()
    
    //comtroles del reproductor play y pause.
    let playPauseButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //notifica al controlador de la vista que tiene que presentar subvistas.
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        if holder.subviews.count == 0 {
            configure()
        }
    }
    
    func configure() {
        
        //configuracion del reproductor.
        let song = songs[position]
        
        //Accedemos al nombre de la canción mediante la url.
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
            //Devuelve la instancia de sesión de audio compartida.
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                print("urlString is nil")
                return
            }
            
            //pasamos el contenido de la url del songSource a AVAudioPlayer
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                print("Player is nil")
                return
            }
            //para que el slider del volumen este por la mitad.
            player.volume = 0.5
            
            //reproducir la canción.
            player.play()
            
        }
        catch {
            print("error occurred")
        }
        
        //portada del album. Hacemos un frame para mostrar las imagenes.
        albumImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: holder.frame.size.width-20,
                                      height: holder.frame.size.width-20)
        
        albumImageView.image = UIImage(named: song.imageName)
        holder.addSubview(albumImageView)
        
        //Configuramos los frames de las etiquetas.
        songNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 20,
                                     width: holder.frame.size.width-20,
                                     height: 70)
        
        albumNameLabel.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height + 60,
                                      width: holder.frame.size.width-20,
                                      height: 70)
        
        artistNameLabel.frame = CGRect(x: 10,
                                       y: albumImageView.frame.size.height + 100,
                                       width: holder.frame.size.width-20,
                                       height: 70)
        
        volume.frame = CGRect(x: 10,
                              y: albumImageView.frame.size.height + 300,
                              width: holder.frame.size.width-20,
                              height: 70)
        
        //asignamos los textos.
        songNameLabel.text = song.name
        albumNameLabel.text = song.albumName
        artistNameLabel.text = song.artistName
        volume.text = "Volumen"
        
        holder.addSubview(songNameLabel)
        holder.addSubview(albumNameLabel)
        holder.addSubview(artistNameLabel)
        holder.addSubview(volume)
        
        //color de fondo del holder.
        holder.backgroundColor = .black
        
        songNameLabel.textColor = .white
        albumNameLabel.textColor = .white
        artistNameLabel.textColor = .white
        volume.textColor = .white
        
        
        //comtroles del reproductor siguiente y atras.
        let nextButton = UIButton()
        let backButton = UIButton()
        
        //frames de los botones. Posicion y escala.
        let yPosition = artistNameLabel.frame.origin.y + 100
        let size: CGFloat = 80
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        backButton.frame = CGRect(x: 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        //Action de los botones.
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        //imagenes de los botones.
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        
        //ponemos color a los botones.
        playPauseButton.tintColor = .white
        nextButton.tintColor = .white
        backButton.tintColor = .white
        
        //añadimos los botones a la subvista.
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        
        //configuracion barra slider de volumen.
        let slider = UISlider(frame: CGRect(x: 20,
                                            y: holder.frame.size.height-60,
                                            width: holder.frame.size.width-40,
                                            height: 50))
        
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
        
    }
    
    //funciones boton play/pause
    @objc func didTapPlayPauseButton() {
        
        //condicion de reproduccion.
        if player?.isPlaying == true {
            //pause
            player?.pause()
            //mostrar el botón de reproducción
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }else {
            //play
            player?.play()
            //mostrar el boton de pause.
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
        
    }
    //funcion boton siguiente cancion.
    @objc func didTapNextButton() {
        if position < (songs.count - 1) {
            position = position + 1
            //para la reproduccion
            player?.stop()
            //bucle para eliminar la subvista
            for subView in holder.subviews {
                subView.removeFromSuperview()
            }
            configure()
        }
        
    }
    //funcion boton atras canciones.
    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            //para la reproduccion
            player?.stop()
            //
            for subView in holder.subviews {
                subView.removeFromSuperview()
            }
            configure()
        }
    }
    
    //funcion para la barra de slider.
    @objc func didSlideSlider(_ slider: UISlider) {
        //ajustar volumen del reproductor
        let value = slider.value
        player?.volume = value
        
    }
    
    //Notifica al controlador que su vista va a desaparecer.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let player = player {
            //parar la reproduccion.
            player.stop()
        }
    }
    
}
