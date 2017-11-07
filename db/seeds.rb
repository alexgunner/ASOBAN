# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create({
  first_name: 'Administrador',
  last_name: 'Principal',
  can_manage_contact: true,
  can_manage_faq: true,
  can_manage_about: true,
  can_manage_articles: true,
  can_manage_events: true,
  can_manage_links: true,
  can_manage_multimedia: true,
  can_manage_carousel: true,
  can_manage_newsletter: true,
  can_manage_admins: true,
  can_manage_boxes:true,
  can_manage_messages:true,
  can_manage_categories:true,
})


User.create({
  email: 'admin@admin.com',
  password: 'adminadmin',
  admin_id: 1
})

Contact.create({
  address: 'Av. Heroinas',
  emails: 'email1@asoban.com%email2@asoban.com',
  phone_numbers: '4415796%4415797%77931468',
  city: 'Cochabamba'
})

Contact.create({
  address: 'Av. Simon Barrientos',
  emails: 'emailLaPaz1@asoban.com',
  phone_numbers: '4415796%4415797%77931468',
  city: 'La Paz'
})

Box.create([
  {
    title: 'Notas de prensa',
    description: 'Nota de Prensa 02/2017 - Utilidades 2016',
    url: '/publications'
  },
  {
    title: 'Reportes de cartera',
    description: 'Reportes de carted 02/2017 - Utilidades 2016',
    url: '/publications'
  },
  {
    title: 'Noticias del sector',
    description: 'Nota de Prensa 02/2017 - Utilidades 2016',
    url: '/publications'
  },
  {
    title: 'Temas de actualidad',
    description: 'Temas de actualidad 2017',
    url: '/publications'
  }
])


statutes_pdf_path = File.join(Rails.root, 'public','estatutos', 'ESTATUTOS_NUEVOS_APROBADOS_22ABR14_FINAL_.pdf')
statutes_pdf_file = File.new(statutes_pdf_path)
About.create({
  mission: 'Representar los legítimos intereses de sus asociados, en un entorno de cooperación y complementariedad, fortaleciendo y promoviendo la confianza del público en las entidades',
  vision: 'Ser una organización representativa del sistema bancario reconocida por su confiabilidad y liderazgo, que contribuye a la integración entre asociados, mercados, comunidad y región latinoamericana.',
  document_title: 'Nuevo Estatuto aprobado el 22 de Abril 2014',
  statute_pdf: ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(statutes_pdf_file),
    :tempfile => statutes_pdf_file,
    :type => 'application/pdf'
  )
})

Category.create([
  {
    name: 'Publicaciones',
    descroption: 'Publicaciones.'
  },
  {
    name: 'Noticias',
    descroption: 'Noticias.'
  }
])

Article.create([
  {
    title: 'Publicacion 1',
    content: 'Lorem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem',
    category_id: 1
  },
  {
    title: 'Publicacion 2',
    content: 'Lorem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem orem ipsum dolor it atem',
    category_id: 1
  },
  {
    title: 'Ranking de Bancos América Economía',
    content: 'Lorem ipsum dolor it atem',
    category_id: 2
  },
  {
    title: 'En 2015 la Banca trabajó bien pero ganó menos',
    content: 'Lorem ipsum dolor it atem',
    category_id: 2
  },
  {
    title: 'Inclusión Financiera',
    content: 'Lorem ipsum dolor it atem',
    category_id: 2
  }
])

event_1_img_path = File.join(Rails.root, 'public','img', 'events', '5taFeriadelCredito.png')
event_1_img_file = File.new(event_1_img_path)
event_2_img_path = File.join(Rails.root, 'public','img', 'events', 'banner.jpg')
event_2_img_file = File.new(event_2_img_path)
event_3_img_path = File.join(Rails.root, 'public','img', 'events', 'feria_scz.png')
event_3_img_file = File.new(event_3_img_path)
registry_img_path = File.join(Rails.root, 'public','img', 'events', 'registro.png')
registry_img_file = File.new(registry_img_path)
registry_pdf_path = File.join(Rails.root, 'public','img', 'events', 'registro.pdf')
registry_pdf_file = File.new(registry_pdf_path)
Event.create([
  {
    title: 'Evento 1',
    description: 'Este es un evento de prueba, el contenido que se encuentra acá es solamente de prueba',
    start_date: Date.new(2017, 11, 11),
    end_date: Date.new(2017, 12, 12),
    location: 'Salón de eventos Avanti',
    picture: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(event_1_img_path),
      :tempfile => event_1_img_file,
      :type => 'image/png'
    ),
    registration_image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(registry_img_path),
      :tempfile => registry_img_file,
      :type => 'image/png'
    ),
    registration_pdf: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(registry_pdf_path),
      :tempfile => registry_pdf_file,
      :type => 'application/pdf'
    )
  },
  {
    title: 'Evento 2',
    description: 'Este es un evento de prueba, el contenido que se encuentra acá es solamente de prueba',
    start_date: Date.new(2017, 11, 11),
    end_date: Date.new(2017, 12, 12),
    location: 'Salón de eventos Flores',
    picture: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(event_2_img_path),
      :tempfile => event_2_img_file,
      :type => 'image/png'
    ),
    registration_image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(registry_img_path),
      :tempfile => registry_img_file,
      :type => 'image/png'
    )
  },
  {
    title: 'Evento 3',
    description: 'Este es un evento de prueba, el contenido que se encuentra acá es solamente de prueba',
    start_date: Date.new(2017, 11, 11),
    end_date: Date.new(2017, 12, 12),
    location: 'Salón de eventos Portal',
    picture: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(event_3_img_path),
      :tempfile => event_3_img_file,
      :type => 'image/png'
    ),
    registration_pdf: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(registry_pdf_path),
      :tempfile => registry_pdf_file,
      :type => 'application/pdf'
    )
  },
  {
    title: 'Evento 4',
    description: 'Este es un evento de prueba, el contenido que se encuentra acá es solamente de prueba',
    start_date: Date.new(2017, 11, 11),
    end_date: Date.new(2017, 12, 12),
    location: 'Salón de eventos Mansion'
  }
])

sponsor_img_path = File.join(Rails.root, 'public','img', 'bancos', 'banco-bisa.png')
sponsor_img_file = File.new(sponsor_img_path)
Sponsor.create([
  {
    event_id: 1,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(sponsor_img_file),
      :tempfile => sponsor_img_file,
      :type => 'image/png'
    )
  },
  {
    event_id: 2,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(sponsor_img_file),
      :tempfile => sponsor_img_file,
      :type => 'image/png'
    )
  },
  {
    event_id: 3,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(sponsor_img_file),
      :tempfile => sponsor_img_file,
      :type => 'image/png'
    )
  }
])

sponsor_img_path = File.join(Rails.root, 'public','img', 'bancos', 'banco-de-credito-bolivia.png')
sponsor_img_file = File.new(sponsor_img_path)
Sponsor.create([
  {
    event_id: 1,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(sponsor_img_file),
      :tempfile => sponsor_img_file,
      :type => 'image/png'
    )
  },
  {
    event_id: 2,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(sponsor_img_file),
      :tempfile => sponsor_img_file,
      :type => 'image/png'
    )
  },
  {
    event_id: 3,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(sponsor_img_file),
      :tempfile => sponsor_img_file,
      :type => 'image/png'
    )
  }
])

sponsor_img_path = File.join(Rails.root, 'public','img', 'bancos', 'banco-de-la-nacion-argentina.png')
sponsor_img_file = File.new(sponsor_img_path)
Sponsor.create([
  {
    event_id: 1,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(sponsor_img_file),
      :tempfile => sponsor_img_file,
      :type => 'image/png'
    )
  },
  {
    event_id: 2,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(sponsor_img_file),
      :tempfile => sponsor_img_file,
      :type => 'image/png'
    )
  },
  {
    event_id: 3,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(sponsor_img_file),
      :tempfile => sponsor_img_file,
      :type => 'image/png'
    )
  }
])

speaker_img_path = File.join(Rails.root, 'public','img', 'speakers', 'speaker.png')
speaker_img_file = File.new(speaker_img_path)
speaker_pdf_path = File.join(Rails.root, 'public','img', 'speakers', 'speaker.pdf')
speaker_pdf_file = File.new(speaker_pdf_path)
Speaker.create([
  {
    title: 'John Doe',
    event_id: 1,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(speaker_img_file),
      :tempfile => speaker_img_file,
      :type => 'image/png'
    ),
    pdf: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(speaker_pdf_file),
      :tempfile => speaker_pdf_file,
      :type => 'application/pdf'
    )
  },
  {
    title: 'Martin Fol',
    event_id: 1,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(speaker_img_file),
      :tempfile => speaker_img_file,
      :type => 'image/png'
    )
  },
  {
    title: 'John Doe',
    event_id: 2,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(speaker_img_file),
      :tempfile => speaker_img_file,
      :type => 'image/png'
    )
  },
  {
    title: 'Martin Fol',
    event_id: 2,
    image: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(speaker_img_file),
      :tempfile => speaker_img_file,
      :type => 'image/png'
    ),
    pdf: ActionDispatch::Http::UploadedFile.new(
      :filename => File.basename(speaker_pdf_file),
      :tempfile => speaker_pdf_file,
      :type => 'application/pdf'
    )
  },
])

Faq.create([
  {
    question: 'Pregunta 1',
    answer: 'Respuesta para la pregunta 1'
  },
  {
    question: 'Pregunta 2',
    answer: 'Respuesta para la pregunta 1'
  },
  {
    question: 'Pregunta 3',
    answer: 'Respuesta para la pregunta 1'
  },
  {
    question: 'Pregunta 4',
    answer: 'Respuesta para la pregunta 1'
  },
  {
    question: 'Pregunta 5',
    answer: 'Respuesta para la pregunta 1'
  }
])

Link.create([
  {
    title: 'Link 1',
    link: 'http://www.asoban.bo',
    #picture: File.new('/assets/bancos/banco-bisa.png')
  },
  {
    title: 'Link 2',
    link: 'http://www.asoban.bo',
    #picture: File.new('/assets/bancos/banco-bisa.png')
  },
  {
    title: 'Link 3',
    link: 'http://www.asoban.bo',
    #picture: File.new('/assets/bancos/banco-bisa.png')
  },
  {
    title: 'Link 4',
    link: 'http://www.asoban.bo',
    #picture: File.new('/assets/bancos/banco-bisa.png')
  },
  {
    title: 'Link 5',
    link: 'http://www.asoban.bo',
    #picture: File.new('/assets/bancos/banco-bisa.png')
  },
  {
    title: 'Link 6',
    link: 'http://www.asoban.bo',
    #picture: File.new('/assets/bancos/banco-bisa.png')
  }
])
