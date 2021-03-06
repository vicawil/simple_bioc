# @author Dongseop Kwon
require "simple_bioc/version"
require "simple_bioc/bioc_reader"
require "simple_bioc/bioc_writer"

# SimpleBioC main library
module SimpleBioC
  module_function

  # parse a BioC XML file in the given path and convert it into a collection instance
  # 
  # ==== Arguments
  # * +file_path+ - file path for parse
  # * +options+ - (optional) additional options
  #
  # ==== Options
  # * +documents+ - specify IDs of documents to parse. The result will include only the specified documents
  #
  # ==== Examples
  #    collection = SimpleBioC.from_xml("./xml/everything.xml")
  #    collection = SimpleBioC.from_xml("./xml/lemma.xml", {documents:[21785578, 21488974]})
  def from_xml(file_path, options = {})
    options[:documents] = options[:documents].map{|e| e.to_s} if options[:documents].kind_of?(Array)
    BioCReader.read(file_path, options)
  end

  # convert a collection instance to a BioC XML text. Output will return as string
  # 
  # ==== Arguments
  # * +collection+ - Collection instance to process
  # * +options+ - (optional) additional options
  #
  # ==== Options
  # * +save_with+ - SaveOption for Nokorigi. If you set this 0, output has no format (no indentation, no whitespace) 
  #
  # ==== Examples
  #    output = SimpleBioC.to_xml(collection)
  #    output = SimpleBioC.to_xml(collection, {save_with: 0})
  def to_xml(collection, options = {})
    BioCWriter.write(collection, options)
  end
end
