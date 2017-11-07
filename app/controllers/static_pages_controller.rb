class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :news, :publications, :about, :certificates, :entities, :contact, :event, :statistics, :events_list, :multimedia, :faq]


  def about
    @about = About.first
  end

  def certificates
    @certification = Certification.new
    @states = [['Cochabamba', 'Cochabamba'], ['Santa Cruz', 'Santa Cruz'], ['La Paz', 'La Paz'],['Oruro', 'Oruro'],['Pando', 'Pando'],['Beni', 'Beni'], ['Tarija', 'Tarija'],['Chuquisaca', 'Chuquisaca'],['Potosí', 'Potosí']]
  end

  def contact
    @contacts = Contact.all.order(:created_at).reverse_order
    @message = Message.new
  end

  def index
    @boxes = Box.all.order(:created_at).reverse_order
    @cards = Card.all.order(:created_at).reverse_order
  end

  def entities
  end

  def news
  end

  def event
    @events = Event.all.order(:created_at).reverse_order
  end

  def publications
  end

  def statistics
  end

  def multimedia
    @multimedia = Gallery.all.order(:created_at).reverse_order
  end

  def events_list
    @events = Event.all.order(:created_at).reverse_order
  end

  def faq
    @events = Event.all.order(:created_at).reverse_order
  end

  def search
    @results = []
    if params[:search]
      @results = PgSearch.multisearch(params[:search])
    end
  end
end
