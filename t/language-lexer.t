use strict;
use warnings;
use Test::More;
use Pegex::Parser;
use GraphQL::Grammar;
use Pegex::Tree;
use Pegex::Input;
use Data::Dumper;

my $parser = Pegex::Parser->new(
  grammar => GraphQL::Grammar->new,
  receiver => Pegex::Tree->new,
);
open my $fh, '<', 't/kitchen-sink.graphql';
my $input = Pegex::Input->new(string => join('', <$fh>));

my $expected = eval join '', <DATA>;
is_deeply $parser->parse($input), $expected, 'lex correct';

done_testing;

__DATA__
[
  [
    [
      [
        'query',
        'queryName',
        [
          [
            [
              [
                'foo'
              ],
              [
                'ComplexType'
              ]
            ],
            [
              [
                'site'
              ],
              [
                'Site'
              ],
              [
                'MOBILE'
              ]
            ]
          ]
        ],
        [
          [
            [
              [
                'whoever123is'
              ],
              'node',
              [
                [
                  [
                    'id',
                    [
                      [
                        '123',
                        '456'
                      ]
                    ]
                  ]
                ]
              ],
              [
                [
                  [
                    'id'
                  ],
                  [
                    [
                      'User'
                    ],
                    [
                      [
                        'defer'
                      ]
                    ],
                    [
                      [
                        [
                          'field2',
                          [
                            [
                              [
                                'id'
                              ],
                              [
                                [
                                  'alias'
                                ],
                                'field1',
                                [
                                  [
                                    [
                                      'first',
                                      '10'
                                    ],
                                    [
                                      'after',
                                      [
                                        'foo'
                                      ]
                                    ]
                                  ]
                                ],
                                [
                                  [
                                    'include',
                                    [
                                      [
                                        [
                                          'if',
                                          [
                                            'foo'
                                          ]
                                        ]
                                      ]
                                    ]
                                  ]
                                ],
                                [
                                  [
                                    [
                                      'id'
                                    ],
                                    [
                                      'frag'
                                    ]
                                  ]
                                ]
                              ]
                            ]
                          ]
                        ]
                      ]
                    ]
                  ],
                  [
                    [
                      [
                        'skip',
                        [
                          [
                            [
                              'unless',
                              [
                                'foo'
                              ]
                            ]
                          ]
                        ]
                      ]
                    ],
                    [
                      [
                        [
                          'id'
                        ]
                      ]
                    ]
                  ],
                  [
                    [
                      [
                        [
                          'id'
                        ]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ],
    [
      [
        'mutation',
        'likeStory',
        [
          [
            [
              'like',
              [
                [
                  [
                    'story',
                    '123'
                  ]
                ]
              ],
              [
                [
                  'defer'
                ]
              ],
              [
                [
                  [
                    'story',
                    [
                      [
                        [
                          'id'
                        ]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ],
    [
      [
        'subscription',
        'StoryLikeSubscription',
        [
          [
            [
              [
                'input'
              ],
              [
                'StoryLikeSubscribeInput'
              ]
            ]
          ]
        ],
        [
          [
            [
              'storyLikeSubscribe',
              [
                [
                  [
                    'input',
                    [
                      'input'
                    ]
                  ]
                ]
              ],
              [
                [
                  [
                    'story',
                    [
                      [
                        [
                          'likers',
                          [
                            [
                              [
                                'count'
                              ]
                            ]
                          ]
                        ],
                        [
                          'likeSentence',
                          [
                            [
                              [
                                'text'
                              ]
                            ]
                          ]
                        ]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ],
    [
      [
        'frag',
        [
          'Friend'
        ],
        [
          [
            [
              'foo',
              [
                [
                  [
                    'size',
                    [
                      'size'
                    ]
                  ],
                  [
                    'bar',
                    [
                      'b'
                    ]
                  ],
                  [
                    'obj',
                    [
                      [
                        [
                          'key',
                          'value'
                        ]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ],
    [
      [
        [
          [
            'unnamed',
            [
              [
                [
                  'truthy',
                  'true'
                ],
                [
                  'falsey',
                  'false'
                ],
                [
                  'nullish'
                ]
              ]
            ]
          ],
          [
            'query'
          ]
        ]
      ]
    ]
  ]
]