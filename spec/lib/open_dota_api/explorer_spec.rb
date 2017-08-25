require 'spec_helper'

describe OpenDotaApi::Explorer do
  let(:explorer_file) { File.read('spec/data/explorer.json') }
  let(:response_json) { JSON.parse(explorer_file) }
  let(:explorer) { OpenDotaApi::Explorer.new(response_json) }

  let(:match_ids) do
    [3_274_329_415, 3_274_330_770, 3_274_393_974, 3_274_394_099, 3_274_481_444, 3_274_481_930, 3_274_557_442, 3_274_564_960, 3_274_667_512, 3_274_669_416, 3_274_794_292, 3_274_794_810, 3_274_795_436, 3_274_800_531, 3_274_804_698, 3_274_816_116, 3_274_904_832, 3_274_904_857, 3_274_908_009, 3_274_927_926, 3_274_935_013, 3_274_946_646, 3_275_011_120, 3_275_012_710, 3_275_038_059, 3_275_045_676, 3_275_056_852, 3_275_066_534, 3_275_108_399, 3_275_124_185, 3_275_178_718, 3_275_183_011, 3_275_206_476, 3_275_248_394, 3_275_276_589, 3_275_297_767, 3_275_340_129, 3_275_351_174, 3_275_399_089, 3_275_405_570, 3_275_412_980, 3_275_492_852, 3_275_546_909, 3_275_549_361, 3_275_553_729, 3_275_563_733, 3_275_667_950, 3_275_683_703, 3_275_686_186, 3_275_689_511, 3_275_695_734, 3_275_738_929, 3_275_764_122, 3_275_790_914, 3_275_808_176, 3_275_808_794, 3_275_810_358, 3_275_824_679, 3_275_825_273, 3_275_836_033, 3_275_918_719, 3_275_918_851, 3_275_921_467, 3_275_927_474, 3_275_929_302, 3_275_931_259, 3_275_933_008, 3_275_935_059, 3_276_010_559, 3_276_013_632, 3_276_014_675, 3_276_025_150, 3_276_025_304, 3_276_025_580, 3_276_027_917, 3_276_054_262, 3_276_084_732, 3_276_090_822, 3_276_098_324, 3_276_104_603, 3_276_105_966, 3_276_111_372, 3_276_129_449, 3_276_156_941, 3_276_160_699, 3_276_169_834, 3_276_224_443, 3_276_226_816, 3_276_229_201, 3_276_246_388, 3_276_278_414, 3_276_279_242, 3_276_281_606, 3_276_294_301, 3_276_330_348, 3_276_333_514, 3_276_365_045, 3_276_376_431, 3_276_384_723, 3_276_392_063, 3_276_393_333, 3_276_393_537, 3_276_393_725, 3_276_395_433, 3_276_431_065, 3_276_432_556, 3_276_441_192, 3_276_453_310, 3_276_455_223, 3_276_456_688, 3_276_461_749, 3_276_481_968, 3_276_494_966, 3_276_519_753, 3_276_522_925, 3_276_529_430, 3_276_531_419, 3_276_543_914, 3_276_548_322, 3_276_550_251, 3_276_550_380, 3_276_585_443, 3_276_594_961, 3_276_616_978, 3_276_619_671, 3_276_630_734, 3_276_678_806, 3_276_680_686, 3_276_692_247, 3_276_727_833, 3_276_779_761, 3_276_799_406, 3_276_816_257, 3_276_818_595, 3_276_819_192, 3_276_819_345, 3_276_820_653, 3_276_828_390, 3_276_896_729, 3_276_908_672, 3_276_934_942, 3_276_935_233, 3_276_940_060, 3_276_945_212, 3_276_957_488, 3_277_009_111, 3_277_010_065, 3_277_032_932, 3_277_054_034, 3_277_066_837, 3_277_071_048, 3_277_076_708, 3_277_122_831, 3_277_141_049, 3_277_147_265, 3_277_169_467, 3_277_175_546, 3_277_179_017, 3_277_209_959, 3_277_270_406, 3_277_283_501, 3_277_285_990, 3_277_286_209, 3_277_297_305, 3_277_312_254, 3_277_331_491, 3_277_360_472, 3_277_383_440, 3_277_430_053, 3_277_445_396, 3_277_457_495, 3_277_502_885, 3_277_526_459, 3_277_530_246, 3_277_565_388, 3_277_585_436, 3_277_609_129, 3_277_642_650, 3_277_677_016, 3_277_691_703, 3_277_707_782, 3_277_730_855, 3_277_744_144, 3_277_769_947, 3_277_794_775, 3_277_799_119, 3_277_816_670, 3_277_830_387, 3_277_831_396, 3_277_853_682, 3_277_867_284, 3_277_897_323, 3_277_905_327, 3_277_914_056, 3_277_922_412, 3_277_928_310, 3_277_934_674, 3_277_937_287, 3_277_974_563, 3_277_991_178, 3_278_008_510, 3_278_010_775, 3_278_014_140, 3_278_015_358, 3_278_019_014, 3_278_061_206, 3_278_080_836, 3_278_082_996, 3_278_110_163, 3_278_114_602, 3_278_118_753, 3_278_137_461, 3_278_171_855, 3_278_176_063, 3_278_177_232, 3_278_232_189, 3_278_238_643, 3_278_239_231, 3_278_246_661, 3_278_279_523, 3_278_288_580, 3_278_304_193, 3_278_313_560, 3_278_320_383, 3_278_326_373, 3_278_365_944, 3_278_370_778, 3_278_387_472, 3_278_401_709, 3_278_401_845, 3_278_441_447, 3_278_449_546, 3_278_455_612, 3_278_458_053, 3_278_458_756, 3_278_470_259, 3_278_498_607, 3_278_534_680, 3_278_536_469, 3_278_548_190, 3_278_549_233, 3_278_554_450, 3_278_590_724, 3_278_601_446, 3_278_604_624, 3_278_648_453, 3_278_675_143, 3_278_690_226, 3_278_691_461, 3_278_691_759, 3_278_707_616, 3_278_764_475, 3_278_779_071, 3_278_794_972, 3_278_815_320, 3_278_885_465, 3_278_894_409, 3_278_898_021, 3_278_913_507, 3_278_913_764, 3_278_950_978, 3_279_022_993, 3_279_027_482, 3_279_029_922, 3_279_048_358, 3_279_141_603, 3_279_158_362, 3_279_170_185, 3_279_200_648, 3_279_245_214, 3_279_270_347, 3_279_296_457, 3_279_344_693, 3_279_352_903, 3_279_392_401, 3_279_441_980, 3_279_449_712, 3_279_564_078, 3_279_586_792, 3_279_683_317, 3_279_718_819, 3_279_723_634, 3_279_800_052, 3_279_814_904, 3_279_862_926, 3_279_901_754, 3_279_907_240, 3_279_952_775, 3_279_990_287, 3_280_002_255, 3_280_092_629, 3_280_117_786, 3_280_169_747, 3_280_170_927, 3_280_219_317, 3_280_290_578, 3_280_349_437, 3_280_437_500, 3_280_440_654, 3_280_495_952, 3_280_507_299, 3_280_520_447, 3_280_569_987, 3_280_581_397, 3_280_624_478, 3_280_678_605, 3_280_710_379, 3_280_779_062, 3_280_816_387, 3_280_868_403, 3_280_916_901, 3_280_917_061, 3_280_960_198, 3_280_962_519, 3_281_023_107, 3_281_036_396, 3_281_076_896, 3_281_132_641, 3_281_159_627, 3_281_300_755, 3_281_304_392, 3_281_439_600, 3_281_467_339, 3_281_628_099, 3_281_703_281, 3_281_724_378, 3_281_780_707, 3_281_806_883, 3_281_853_891, 3_281_917_774, 3_281_979_282, 3_281_992_071, 3_282_010_340, 3_282_062_366, 3_282_102_427, 3_282_193_242, 3_282_203_829, 3_282_243_909, 3_282_263_076, 3_282_300_073, 3_282_333_669, 3_282_412_777, 3_282_475_291, 3_282_551_966, 3_282_553_363, 3_282_621_169, 3_282_763_119, 3_282_839_690, 3_351_961_375, 3_351_963_840, 3_351_973_181, 3_351_993_496, 3_352_043_080, 3_352_045_427, 3_352_061_045, 3_352_100_275, 3_352_104_337, 3_352_119_361, 3_352_140_562, 3_352_153_962, 3_352_163_167, 3_352_190_511, 3_352_200_165, 3_352_220_260, 3_352_237_075, 3_352_267_755, 3_352_275_698, 3_352_286_942, 3_352_291_980, 3_352_320_088, 3_352_323_980, 3_352_327_788, 3_352_328_440, 3_352_363_731, 3_352_367_990, 3_352_382_741, 3_352_383_050, 3_352_405_556, 3_352_409_888, 3_352_416_060, 3_352_427_223, 3_352_455_755, 3_352_461_389, 3_352_462_460, 3_352_464_853, 3_352_501_269, 3_352_505_678, 3_352_509_754, 3_353_737_069, 3_353_737_967, 3_353_738_510, 3_353_742_932, 3_353_837_163, 3_353_838_092, 3_353_841_477, 3_353_852_872, 3_353_901_258, 3_353_916_502, 3_353_935_010, 3_353_935_410, 3_353_989_523, 3_353_994_974, 3_354_000_170, 3_354_031_843, 3_354_057_627, 3_354_058_128, 3_354_063_346, 3_354_101_340, 3_354_118_306, 3_354_120_039, 3_354_123_160, 3_354_159_000, 3_354_162_376, 3_354_167_956, 3_354_180_190, 3_354_210_396, 3_354_214_459, 3_354_219_214, 3_354_220_626, 3_354_247_448, 3_354_249_527, 3_354_284_596, 3_354_286_673, 3_354_292_598, 3_354_297_698, 3_354_333_670, 3_354_341_710, 3_354_345_479, 3_355_640_875, 3_355_646_788, 3_355_653_623, 3_355_657_953, 3_355_741_305, 3_355_751_279, 3_355_751_343, 3_355_760_651, 3_355_805_274, 3_355_838_924, 3_355_853_872, 3_355_859_622, 3_355_887_483, 3_355_934_709, 3_355_938_154, 3_355_944_219, 3_355_980_143, 3_356_007_093, 3_356_009_819, 3_356_035_808, 3_356_044_327, 3_356_066_834, 3_356_083_896, 3_356_100_221, 3_356_102_779, 3_356_137_447, 3_356_148_145, 3_356_160_859, 3_356_189_302, 3_356_203_606, 3_356_203_915, 3_356_214_219, 3_356_245_174, 3_356_251_885, 3_356_260_301, 3_356_274_394, 3_356_308_437, 3_356_321_398, 3_356_371_427, 3_356_461_133, 3_357_766_680, 3_357_776_843, 3_357_776_957, 3_357_781_916, 3_357_885_749, 3_357_890_369, 3_357_892_393, 3_357_952_027, 3_357_974_421, 3_357_986_778, 3_358_011_344, 3_358_044_227, 3_358_068_997, 3_358_069_339, 3_358_105_051, 3_358_109_772, 3_358_153_024, 3_358_157_593, 3_358_183_864, 3_358_205_135, 3_358_228_417, 3_358_232_771, 3_358_237_109, 3_358_299_746, 3_362_113_115, 3_362_175_204, 3_362_247_584, 3_362_331_228, 3_362_390_555, 3_362_458_643, 3_362_526_195, 3_362_609_879, 3_362_675_038, 3_363_973_439, 3_364_084_016, 3_364_162_010, 3_364_210_383, 3_364_267_872, 3_364_308_762, 3_364_351_128, 3_364_409_216, 3_364_482_110, 3_365_858_882, 3_365_946_637, 3_366_042_233, 3_366_096_005, 3_366_166_505, 3_366_236_403, 3_366_289_447, 3_366_363_258, 3_366_419_778, 3_367_820_228, 3_367_897_602, 3_367_983_348, 3_368_083_254, 3_368_158_118, 3_368_249_009, 3_368_300_783, 3_368_387_319, 3_369_858_045, 3_369_930_606, 3_370_054_178, 3_370_154_221, 3_370_213_472, 3_370_307_979, 3_370_363_807, 3_372_269_708, 3_372_386_596, 3_372_455_628, 3_372_622_939, 3_372_676_225, 3_372_726_385]
  end

  let(:api_url) { "http://api.opendota.com/api/#{endpoint}" }

  it 'returns endpoint' do
    expect(described_class::ENDPOINT).to eq 'explorer'
  end

  it 'inherits entity object' do
    expect(match_ids).to be_a Array
  end

  describe 'default attributes' do
    it 'returns id' do
      expect(explorer.league_matches_ids).to match_array(match_ids)
    end
  end
end
