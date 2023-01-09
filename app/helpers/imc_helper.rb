module ImcHelper
  #Realiza o cálculo do IMC e retorna um json com a classificação
  def calculate(data)
    imc = data[:weight] / data[:height]**2 
    data = {
      imc: imc.round(2)
    } 
    data.merge(classification(imc))
  end
  
  #Define a classificação de peso 
  def classification(imc)
    case imc
    when 0..18.5
      { classification:'Abaixo do peso' }
    when 18.6..24.9
      { classification:'Peso normal' }
    when 25.0..29.9
      { classification:'Sobrepeso' }
    when 30..34.9
      {
        classification: 'Obesidade',
        type: 'I'
      }
    when 35..39.9
      {
        classification: 'Obesidade',
        type: 'II'
      }
    when 40...Float::INFINITY
      {
        classification: 'Obesidade',
        type: 'III ou Mórbida'
      }
    else 
      {message: 'Verifique os Parâmetros enviados!'}
    end
  end
  
end
