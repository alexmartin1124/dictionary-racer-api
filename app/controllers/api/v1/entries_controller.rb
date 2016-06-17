module Api
  module V1
    class EntriesController < ApplicationController
      def index
        if params[:filter]
          key = params[:filter].keys[0]
          value = params[:filter].values[0]
          # conditional to add missing words to nounlist
          entry = Entry.find_by(key => value)
          entry = EntryCreator.new(value).create_entry if !entry && key == 'word'
          splitdef = entry.definition.gsub(/[^a-zA-Z0-9 ]/, "")
          entry.definition = splitdef
          entry.save
          # splitdef = entry.definition.gsub(/[^a-zA-Z0-9 ]/, "").split
          # set_to_true = {}
          # splitdef.each do |word|
          #   Entry.find_by(word: word) ? set_to_true[word] = true : set_to_true[word] = false
          # end
          # data = {data: [{
          #   id: entry.id,
          #   type: "entries",
          #   attributes: {
          #   entry: entry,
          #   definition: splitdef,
          #   checkword: set_to_true}
          # }]}
          render json: entry
        else
          render json: Entry.includes(:puzzles), include: ['puzzles']
        end
      end
    end
  end
end
